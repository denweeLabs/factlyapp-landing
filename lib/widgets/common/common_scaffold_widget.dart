import 'package:factlyapp_landing/main.dart';
import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decoration = isMobile
        ? BoxDecoration(color: theme.colorScheme.background)
        : BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.background,
                theme.colorScheme.onBackground,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          );

    return DecoratedBox(
      decoration: decoration,
      child: Material(type: MaterialType.transparency, child: body),
    );
  }
}
