part of 'package:factlyapp_landing/pages/account_deletion/account_deletion_page.dart';

class _DesktopView extends StatelessWidget {
  const _DesktopView(this.constraints);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final imagePath = context.isLightTheme
        ? AppAssets.accountDeletionLight
        : AppAssets.accountDeletionDark;

    return Column(
      children: [
        const CommonAppBar(title: AccountDeletionPage.appBarTitle),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CommonSealAnimatedIcon().fadeInUp(
                        curve: Curves.linearToEaseOut,
                        duration: const Duration(milliseconds: 1200),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        AccountDeletionPage.stepsTitle,
                        style: h0.copyWith(
                          fontSize: 24,
                          color: context.textColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ).fadeInUp(
                        curve: Curves.linearToEaseOut,
                        duration: const Duration(milliseconds: 1200),
                      ),
                      const SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AccountDeletionPage.steps
                            .map(
                              (e) => Text(
                                e,
                                style: TextStyle(
                                  height: 2.5,
                                  fontSize: 14,
                                  letterSpacing: 0.4,
                                  color: context.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.primaryFont,
                                ),
                              ),
                            )
                            .toList(),
                      ).fadeInUp(
                        curve: Curves.linearToEaseOut,
                        duration: const Duration(milliseconds: 800),
                        delay: const Duration(milliseconds: 300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
