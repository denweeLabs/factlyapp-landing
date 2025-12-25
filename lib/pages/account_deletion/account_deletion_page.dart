import 'package:animate_do/animate_do.dart';
import 'package:factlyapp_landing/constants/app_assets.dart';
import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/main.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/theme/text_styles.dart';
import 'package:factlyapp_landing/widgets/animations/responsive_builder_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_scaffold_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_seal_animated_icon_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_terms_privacy_app_bar_widget.dart';
import 'package:flutter/material.dart';

part 'views/mobile_view.dart';
part 'views/desktop_view.dart';

class AccountDeletionPage extends StatefulWidget {
  const AccountDeletionPage({super.key});

  static const appBarTitle = 'Delete Account';
  static const stepsTitle = ' Steps to delete an account :(';
  static List<String> steps = [
    '1. Open Account page',
    '2. Tap on your profile',
    "3. Tap on DELETE ACCOUNT button",
    '4. Confirm',
  ];

  @override
  State<AccountDeletionPage> createState() => _AccountDeletionPageState();
}

class _AccountDeletionPageState extends State<AccountDeletionPage> {
  @override
  void didChangeDependencies() {
    final image = themeNotifier.isLight
        ? AppAssets.accountDeletionDark
        : AppAssets.accountDeletionLight;
    precacheImage(AssetImage(image), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: ResponsiveBuilder(
        mobile: _MobileView.new,
        desktop: _DesktopView.new,
      ),
    );
  }
}
