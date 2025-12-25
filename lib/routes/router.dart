// ignore_for_file: prefer_function_declarations_over_variables

import 'package:factlyapp_landing/pages/account_deletion/account_deletion_page.dart';
import 'package:factlyapp_landing/pages/home/home_page.dart';
import 'package:factlyapp_landing/pages/privacy/privacy_page.dart';
import 'package:factlyapp_landing/pages/terms/terms_page.dart';
import 'package:factlyapp_landing/pages/unknown_route/unknown_route_page.dart';
import 'package:factlyapp_landing/routes/page_builders/fade_slideup_page_route_builder.dart';
import 'package:go_router/go_router.dart';

abstract class Routes {
  static const home = '/';
  static const privacy = '/privacy';
  static const terms = '/terms';
  static const accountDeletion = '/account-deletion';
}

final rootRouter = GoRouter(
  initialLocation: Routes.home,
  errorBuilder: (_, __) => const UnknownRoutePage(),
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
      path: Routes.privacy,
      pageBuilder: (_, state) => FadeSlideupPage(
        key: state.pageKey,
        child: const PrivacyPage(),
      ),
    ),
    GoRoute(
      path: Routes.terms,
      pageBuilder: (_, state) => FadeSlideupPage(
        key: state.pageKey,
        child: const TermsPage(),
      ),
    ),
    GoRoute(
      path: Routes.accountDeletion,
      pageBuilder: (_, state) => FadeSlideupPage(
        key: state.pageKey,
        child: const AccountDeletionPage(),
      ),
    ),
  ],
);
