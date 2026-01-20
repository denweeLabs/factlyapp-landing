part of 'package:factlyapp_landing/pages/home/home_page.dart';

class _MobileView extends StatefulWidget {
  const _MobileView();

  static const colorPickerSize = Size(230, 78);

  @override
  State<_MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<_MobileView> {
  static const scrollMaxOffset = 400.0;

  final scrollController = ScrollController();
  final scrollFraction = ValueNotifier(0.0);

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(scrollListener)
      ..dispose();
    scrollFraction.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.position.axis == Axis.vertical) {
      final offset = scrollController.offset;
      final fraction = offset / scrollMaxOffset;
      scrollFraction.value = fraction;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            HomeMobileHeader(
              constraints: constraints,
              scrollFraction: scrollFraction,
            ),
            ListView(
              controller: scrollController,
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: constraints.maxHeight * 0.06),
                HomeMobileMockupsPageView(constraints: constraints),
                const SizedBox(height: 42),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: const CommonAppTitleSubtitle(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    subtitleAlign: TextAlign.center,
                  ),
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
                const SizedBox(height: 128),
                const Center(child: CommonTermsPrivacyLinks()),
                const SizedBox(height: 32),
                _buildFooter(context),
                const SizedBox(height: 64),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        children: [
          Center(
            child: SizedBox.fromSize(
              size: _MobileView.colorPickerSize,
              child: Stack(
                children: [
                  ColorationOverviewSelector(
                    bubbleSize: _MobileView.colorPickerSize.height / 1.7,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: TapHoverAnimation(
              onTap: themeNotifier.toggleThemeMode,
              child: SizedBox.square(
                dimension: _MobileView.colorPickerSize.height,
                child: const CommonThemeToggleIcon(size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
