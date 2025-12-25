import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  final Widget Function(BoxConstraints) mobile;
  final Widget Function(BoxConstraints) desktop;

  static const desktopWidth = 740;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > desktopWidth;
        if (isDesktop) return desktop(constraints);
        return mobile(constraints);
      },
    );
  }
}
