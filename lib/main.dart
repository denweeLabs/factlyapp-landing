import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/routes/router.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/localization/codegen_loader.g.dart';
import 'package:factlyapp_landing/theme/app_theme_data.dart';
import 'package:factlyapp_landing/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:collection/collection.dart';

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
  final requestedBrightness = queryParameters['brightness'];
  final appBrightness = requestedBrightness == 'light'
      ? Brightness.light
      : requestedBrightness == 'dark'
      ? Brightness.dark
      : SchedulerBinding.instance.platformDispatcher.platformBrightness;
  final appThemeMode = appBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;

  final requestedThemeColorationId = queryParameters['coloration'];
  final parsedThemeColorationId = requestedThemeColorationId != null ? int.tryParse(requestedThemeColorationId) : null;
  final validatedThemeColorationid = parsedThemeColorationId == null
      ? null
      : AppConstants.themeColorations.firstWhereOrNull((e) => e.id == parsedThemeColorationId)?.id;
  final appThemeColoration = validatedThemeColorationid ?? AppConstants.defaultThemeColorationId;

  final appThemeData = AppThemeData(mode: appThemeMode, colorationId: appThemeColoration);
  themeNotifier = ThemeNotifier.fromData(appThemeData);

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

  static const title = 'Denwee App';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void dispose() {
    themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, themeData, _) {
        final themeColorationId = themeData.colorationId;
        final themeColoration = AppConstants.themeColorations.firstWhere(
          (coloration) => coloration.id == themeColorationId,
        );

        return MaterialApp.router(
          title: MainApp.title,
          restorationScopeId: 'app',
          debugShowCheckedModeBanner: false,
          themeAnimationCurve: Curves.ease,
          themeAnimationDuration: const Duration(milliseconds: 600),
          locale: EasyLocalization.of(context)!.locale,
          localizationsDelegates: EasyLocalization.of(context)!.delegates,
          supportedLocales: EasyLocalization.of(context)!.supportedLocales,
          theme: AppTheme.fromType(ThemeType.light).themeData(themeColoration),
          darkTheme: AppTheme.fromType(
            ThemeType.dark,
          ).themeData(themeColoration),
          themeMode: themeData.mode,
          routerConfig: rootRouter,
          builder: (context, child) => child!,
        ).fadeIn(duration: const Duration(milliseconds: 600));
      },
    );
  }
}
