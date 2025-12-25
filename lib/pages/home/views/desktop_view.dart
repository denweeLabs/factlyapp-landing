part of 'package:factlyapp_landing/pages/home/home_page.dart';

class _DesktopView extends StatelessWidget {
  const _DesktopView(this.constraints);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final imagePath = context.isLightTheme
        ? AppAssets.dualPhoneMockupLight
        : AppAssets.dualPhoneMockupDark;

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.68,
                    child: Image.asset(imagePath).fadeInRight(
                      from: 150,
                      curve: Curves.linearToEaseOut,
                      duration: const Duration(milliseconds: 1600),
                      delay: const Duration(milliseconds: 100),
                    ),
                  ),
                ),
                const SizedBox(width: 64),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CommonSealAnimatedIcon(),
                          const SizedBox(width: 10),
                          Text(
                            context.tr(LocaleKeys.home_title),
                            style: h0.copyWith(
                              fontSize: 42,
                              color: context.textColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(width: 40),
                        ],
                      ).fadeInUp(
                        curve: Curves.linearToEaseOut,
                        duration: const Duration(milliseconds: 1200),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        context.tr(LocaleKeys.home_subtitle),
                        style: bodyL.copyWith(
                          color: context.textColorSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ).fadeInUp(
                        curve: Curves.linearToEaseOut,
                        duration: const Duration(milliseconds: 800),
                        delay: const Duration(milliseconds: 300),
                      ),
                      const SizedBox(height: 42),
                      Wrap(
                        spacing: 14,
                        runSpacing: 14,
                        alignment: WrapAlignment.center,
                        children: [
                          const AppleStoreButton().fadeInUp(
                            curve: AppConstants.lightElasticOut,
                            duration: const Duration(milliseconds: 1800),
                            delay: const Duration(milliseconds: 600),
                          ),
                          const GooglePlayButton().fadeInUp(
                            curve: AppConstants.lightElasticOut,
                            duration: const Duration(milliseconds: 1800),
                            delay: const Duration(milliseconds: 800),
                          ),
                          const GithubButton().fadeInUp(
                            curve: AppConstants.lightElasticOut,
                            duration: const Duration(milliseconds: 1800),
                            delay: const Duration(milliseconds: 1000),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const HomeFooter.desktop(),
      ],
    );
  }
}
