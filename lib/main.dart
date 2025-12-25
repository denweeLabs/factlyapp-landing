import 'package:easy_localization/easy_localization.dart';
import 'package:factlyapp_landing/constants/app_assets.dart';
import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/routes/router.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/localization/codegen_loader.g.dart';
import 'package:factlyapp_landing/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

late final ThemeNotifier themeNotifier;
final bool isMobile = isMobileWeb();
final bool isDesktop = isDesktopWeb();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Query params
  final queryParameters = Uri.base.queryParameters;

  // Init localizations
  await EasyLocalization.ensureInitialized();
  final requestedLocale = queryParameters[AppConstants.languageKeyName] != null
      ? Locale(queryParameters[AppConstants.languageKeyName]!)
      : null;
  final appLocale = AppConstants.supportedLocales.contains(requestedLocale)
      ? requestedLocale
      : PlatformDispatcher.instance.locale;

  // Init theme
  themeNotifier = ThemeNotifier.fromPlatformBrightness(
    SchedulerBinding.instance.platformDispatcher.platformBrightness,
  );

  // Enable path navigation
  usePathUrlStrategy();

  // Run app
  runApp(
    RootRestorationScope(
      restorationId: 'root',
      child: EasyLocalization(
        saveLocale: false,
        useOnlyLangCode: true,
        startLocale: appLocale,
        supportedLocales: AppConstants.supportedLocales,
        fallbackLocale: AppConstants.fallbackLocale,
        path: AppConstants.localesPath,
        assetLoader: const CodegenLoader(),
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static const title = 'Denwee';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImages();
    });
  }

  @override
  void dispose() {
    themeNotifier.dispose();
    super.dispose();
  }

  void precacheImages() {
    final images = isDesktop
        ? [
            AppAssets.singlePhoneMockup1,
            themeNotifier.value == ThemeMode.dark
                ? AppAssets.dualPhoneMockupLight
                : AppAssets.dualPhoneMockupDark,
          ]
        : [
            themeNotifier.value == ThemeMode.dark
                ? AppAssets.singlePhoneMockup3Light
                : AppAssets.singlePhoneMockup3Dark,
          ];

    for (final image in images) {
      precacheImage(AssetImage(image), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) => MaterialApp.router(
        title: MainApp.title,
        restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,
        themeAnimationCurve: Curves.ease,
        themeAnimationDuration: const Duration(milliseconds: 600),
        locale: EasyLocalization.of(context)!.locale,
        localizationsDelegates: EasyLocalization.of(context)!.delegates,
        supportedLocales: EasyLocalization.of(context)!.supportedLocales,
        theme: AppTheme.fromType(ThemeType.light).themeData(),
        darkTheme: AppTheme.fromType(ThemeType.dark).themeData(),
        themeMode: themeMode,
        routerConfig: rootRouter,
        builder: (context, child) => child!,
      ),
    );
  }
}
