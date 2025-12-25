import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:factlyapp_landing/constants/app_assets.dart';
import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/localization/locale_keys.g.dart';
import 'package:factlyapp_landing/pages/home/widgets/home_footer_widget.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/theme/text_styles.dart';
import 'package:factlyapp_landing/widgets/buttons/apple_store_button_widget.dart';
import 'package:factlyapp_landing/widgets/buttons/github_button_widget.dart';
import 'package:factlyapp_landing/widgets/buttons/google_play_button_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_scaffold_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_seal_animated_icon_widget.dart';
import 'package:factlyapp_landing/widgets/animations/responsive_builder_widget.dart';
import 'package:factlyapp_landing/widgets/animations/tap_hover_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

part 'views/desktop_view.dart';
part 'views/mobile_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(AssetImage(AppAssets.dualPhoneMockupDark), context);
      precacheImage(AssetImage(AppAssets.dualPhoneMockupLight), context);
      precacheImage(AssetImage(AppAssets.singlePhoneMockup1), context);
    });
    super.initState();
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
