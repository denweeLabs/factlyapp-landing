import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:factlyapp_landing/constants/app_assets.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/widgets/animations/tap_hover_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeMobileMockupsPageView extends StatefulWidget {
  const HomeMobileMockupsPageView({super.key, required this.constraints});

  final BoxConstraints constraints;

  static const animationDuration = Duration(milliseconds: 600);
  static const animationCurve = Curves.ease;

  @override
  State<HomeMobileMockupsPageView> createState() =>
      _HomeMobileMockupsPageViewState();
}

class _HomeMobileMockupsPageViewState extends State<HomeMobileMockupsPageView> {
  static const pageViewportFraction = 0.999;
  static const autoPageSwitchDuration = Duration(seconds: 8);
  static const totalPagesCount = 2;

  late final pageController = PageController(
    viewportFraction: pageViewportFraction,
  );
  late final selectedIndex = ValueNotifier<int>(0);

  Timer? autoPageTimer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(pageListener);
    autoAnimatePages();
  }

  @override
  void dispose() {
    autoPageTimer?.cancel();
    selectedIndex.dispose();
    pageController
      ..removeListener(pageListener)
      ..dispose();
    super.dispose();
  }

  void pageListener() {
    final page = pageController.page ?? 0;
    final index = page.round();
    if (index != selectedIndex.value) {
      selectedIndex.value = index;
    }
  }

  void autoAnimatePages() {
    autoPageTimer?.cancel();
    autoPageTimer = Timer.periodic(autoPageSwitchDuration, (_) {
      if (selectedIndex.value == totalPagesCount - 1) {
        animateMockupPage(0);
      } else {
        pageController.nextPage(
          duration: HomeMobileMockupsPageView.animationDuration,
          curve: HomeMobileMockupsPageView.animationCurve,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = context.locale.languageCode.toLowerCase();

    return SizedBox.fromSize(
      size: Size.fromHeight(widget.constraints.maxHeight * 0.52),
      child: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (context, selectedIndex, _) => Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (_) => autoAnimatePages(),
              children: [
                _buildMockupPage(
                  index: 0,
                  selectedIndex: selectedIndex,
                  imagePath: AppAssets.singlePhone1(languageCode),
                ),
                _buildMockupPage(
                  index: 1,
                  selectedIndex: selectedIndex,
                  imagePath: AppAssets.singlePhone2(languageCode),
                ),
              ],
            ).fadeInUp(
              curve: Curves.linearToEaseOut,
              duration: const Duration(milliseconds: 1200),
              delay: const Duration(milliseconds: 200),
            ),
            Positioned(
              left: 28,
              top: 0.0,
              bottom: 0.0,
              child: Center(
                child:
                    _buildPageChangeButton(
                      iconPath: AppAssets.arrowLeftIos,
                      onTap: () => pageController.previousPage(
                        duration: HomeMobileMockupsPageView.animationDuration,
                        curve: HomeMobileMockupsPageView.animationCurve,
                      ),
                    ).elasticIn(
                      curve: Curves.easeInOutBack,
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 200),
                    ),
              ),
            ),
            Positioned(
              right: 28,
              top: 0.0,
              bottom: 0.0,
              child: Center(
                child:
                    _buildPageChangeButton(
                      iconPath: AppAssets.arrowRightIos,
                      onTap: () => pageController.nextPage(
                        duration: HomeMobileMockupsPageView.animationDuration,
                        curve: HomeMobileMockupsPageView.animationCurve,
                      ),
                    ).elasticIn(
                      curve: Curves.easeInOutBack,
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 400),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMockupPage({
    required int index,
    required int selectedIndex,
    required String imagePath,
  }) {
    final isSelected = selectedIndex == index;
    final opacity = isSelected ? 1.0 : 0.0;

    return Center(
      child: AnimatedOpacity(
        opacity: opacity,
        duration: HomeMobileMockupsPageView.animationDuration,
        curve: HomeMobileMockupsPageView.animationCurve,
        child: Image.asset(imagePath),
      ),
    );
  }

  Widget _buildPageChangeButton({
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return TapHoverAnimation(
      onTap: onTap,
      child: SizedBox.square(
        dimension: 42,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.lightPrimaryContainer,
            border: Border.all(color: Colors.black12),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 8.0),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(
                  context.darkIconColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void animateMockupPage(int index) {
    pageController.animateToPage(
      index,
      duration: HomeMobileMockupsPageView.animationDuration,
      curve: HomeMobileMockupsPageView.animationCurve,
    );
  }
}
