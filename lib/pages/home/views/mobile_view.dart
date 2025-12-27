part of 'package:factlyapp_landing/pages/home/home_page.dart';

class _MobileView extends StatefulWidget {
  const _MobileView(this.constraints);

  final BoxConstraints constraints;

  static const animationDuration = Duration(milliseconds: 600);
  static const animationCurve = Curves.ease;

  @override
  State<_MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<_MobileView> {
  static const pageViewportFraction = 0.999;
  static const autoPageSwitchDuration = Duration(seconds: 8);
  static const totalPagesCount = 3;

  late final pageController = PageController(viewportFraction: pageViewportFraction);
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
          duration: _MobileView.animationDuration,
          curve: _MobileView.animationCurve,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final phoneMockupCarouselHeight = widget.constraints.maxHeight * 0.48;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: topPadding),
        const SizedBox(height: 42),
        SizedBox(
          width: double.infinity,
          height: phoneMockupCarouselHeight,
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
                      imagePath: AppAssets.singlePhoneMockup1,
                    ),
                    _buildMockupPage(
                      index: 1,
                      selectedIndex: selectedIndex,
                      imagePath: AppAssets.singlePhoneMockup2,
                    ),
                    _buildMockupPage(
                      index: 2,
                      selectedIndex: selectedIndex,
                      imagePath: context.isLightTheme
                          ? AppAssets.singlePhoneMockup3Light
                          : AppAssets.singlePhoneMockup3Dark,
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
                    child: _buildPageChangeButton(
                      iconPath: AppAssets.arrowLeftIos,
                      onTap: () => pageController.previousPage(
                        duration: _MobileView.animationDuration,
                        curve: _MobileView.animationCurve,
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
                    child: _buildPageChangeButton(
                      iconPath: AppAssets.arrowRightIos,
                      onTap: () => pageController.nextPage(
                        duration: _MobileView.animationDuration,
                        curve: _MobileView.animationCurve,
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
        ),
        const SizedBox(height: 42),
        Text(
          context.tr(LocaleKeys.home_title),
          style: h0.copyWith(fontSize: 34, color: context.textColor),
          textAlign: TextAlign.center,
        ).fadeInUp(
          curve: Curves.linearToEaseOut,
          duration: const Duration(milliseconds: 1200),
          delay: const Duration(milliseconds: 500),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Text(
            context.tr(LocaleKeys.home_subtitle),
            style: bodyL.copyWith(color: context.textColorSecondary),
            textAlign: TextAlign.center,
          ),
        ).fadeInUp(
          curve: Curves.linearToEaseOut,
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 800),
        ),
        const SizedBox(height: 42),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: Wrap(
            spacing: 14,
            runSpacing: 14,
            alignment: WrapAlignment.center,
            children: [
              const AppleStoreButton().fadeInUp(
                curve: AppConstants.lightElasticOut,
                duration: const Duration(milliseconds: 1800),
                delay: const Duration(milliseconds: 1100),
              ),
              const GooglePlayButton().fadeInUp(
                curve: AppConstants.lightElasticOut,
                duration: const Duration(milliseconds: 1800),
                delay: const Duration(milliseconds: 1400),
              ),
              const GithubButton().fadeInUp(
                curve: AppConstants.lightElasticOut,
                duration: const Duration(milliseconds: 1800),
                delay: const Duration(milliseconds: 1700),
              ),
            ],
          ),
        ),
        const SizedBox(height: 140),
        const HomeFooter.mobile(),
      ],
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
        duration: _MobileView.animationDuration,
        curve: _MobileView.animationCurve,
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
            color: context.primaryContainer,
            border: Border.all(color: Colors.white10),
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
                  context.iconColor,
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
      duration: _MobileView.animationDuration,
      curve: _MobileView.animationCurve,
    );
  }
}
