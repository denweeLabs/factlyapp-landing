import 'package:animate_do/animate_do.dart';
import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/main.dart';
import 'package:factlyapp_landing/pages/home/views/desktop/widgets/background_shape_widget.dart';
import 'package:factlyapp_landing/pages/home/views/desktop/widgets/phone_mockups_widget.dart';
import 'package:factlyapp_landing/pages/home/views/desktop/widgets/side_content_widget.dart';
import 'package:factlyapp_landing/pages/home/views/mobile/widgets/header_widget.dart';
import 'package:factlyapp_landing/pages/home/views/mobile/widgets/mockups_page_view_widget.dart';
import 'package:factlyapp_landing/widgets/animations/coloration_overview_selector_widget.dart';
import 'package:factlyapp_landing/widgets/animations/responsive_size_change_builder_widget.dart';
import 'package:factlyapp_landing/widgets/buttons/apple_store_button_widget.dart';
import 'package:factlyapp_landing/widgets/buttons/github_button_widget.dart';
import 'package:factlyapp_landing/widgets/buttons/google_play_button_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_app_title_subtitle_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_scaffold_widget.dart';
import 'package:factlyapp_landing/widgets/animations/tap_hover_animation_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_terms_privacy_links_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_theme_toggle_icon_widget.dart';
import 'package:flutter/material.dart';

part 'views/desktop/desktop_view.dart';
part 'views/mobile/mobile_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: ResponsiveSizeChangeBuilder(
        builder: (context, size) {
          switch (size) {
            case ResponsiveSize.desktop: return const _DesktopView(false);
            case ResponsiveSize.tablet: return const _DesktopView(true);
            default: return _MobileView();
          }
        },
      ),
    );
  }
}
