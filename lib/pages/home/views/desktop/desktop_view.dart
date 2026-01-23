part of 'package:factlyapp_landing/pages/home/home_page.dart';

class _DesktopView extends StatelessWidget {
  const _DesktopView(this.isTabletSize);

  final bool isTabletSize;

  static const leftPadding = 72.0;
  static const rightPadding = 24.0;
  static const phonesMockupWidth = 540.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: HomeDesktopBackgroundShape()),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(
              left: leftPadding,
              right: rightPadding,
            ),
            child: Row(
              children: [
                Expanded(
                  child: HomeDesktopSideContent(
                    isTablet: isTabletSize,
                    hPadding: leftPadding,
                  ),
                ),
                const SizedBox(width: leftPadding),
                const SizedBox(
                  height: double.infinity,
                  width: phonesMockupWidth,
                  child: HomeDesktopPhoneMockups(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
