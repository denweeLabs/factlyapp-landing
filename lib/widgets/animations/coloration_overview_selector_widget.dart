import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/main.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/widgets/animations/coloration_item_bubble_widget.dart';
import 'package:flutter/material.dart';

class ColorationOverviewSelector extends StatefulWidget {
  const ColorationOverviewSelector({super.key, required this.bubbleSize});

  final double bubbleSize;

  @override
  State<ColorationOverviewSelector> createState() =>
      _ColorationOverviewSelectorState();
}

class _ColorationOverviewSelectorState
    extends State<ColorationOverviewSelector> {
  static const viewportFraction = 0.31;

  late final PageController pageController;

  @override
  void initState() {
    final currentColorationId = themeNotifier.value.colorationId;
    final pageIndex = AppConstants.themeColorations.indexWhere(
      (e) => e.id == currentColorationId,
    );
    pageController = PageController(
      viewportFraction: viewportFraction,
      initialPage: pageIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        gradient: AppConstants.commonColoredGradient(context),
        shape: const RoundedSuperellipseBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        shadows: [
          BoxShadow(
            color: context.theme.colorScheme.primary,
            offset: const Offset(0.0, 20.0),
            spreadRadius: -25.0,
            blurRadius: 25.0,
          ),
        ],
      ),
      child: PageView.builder(
        controller: pageController,
        onPageChanged: _onPageChanged,
        itemCount: AppConstants.themeColorations.length,
        itemBuilder: (context, index) {
          final coloration = AppConstants.themeColorations[index];
          final isSelected =
              themeNotifier.value.colorationId == coloration.id;
          return ColorationItemBubble(
            size: widget.bubbleSize,
            index: index,
            offset: Offset.zero,
            coloration: coloration,
            isSelected: isSelected,
            onTap: (_) => _animateTo(index),
          );
        },
      ),
    );
  }

  void _animateTo(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  void _onPageChanged(int index) {
    themeNotifier.changeThemeColoration(
      AppConstants.themeColorations[index].id,
    );
  }
}
