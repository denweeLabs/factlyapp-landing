import 'package:flutter/material.dart';

enum ResponsiveSize {
  mobile,
  tablet,
  desktop,
}

typedef ResponsiveBuilder = Widget Function(
  BuildContext context,
  ResponsiveSize size,
);

class ResponsiveSizeChangeBuilder extends StatefulWidget {
  const ResponsiveSizeChangeBuilder({
    super.key,
    required this.builder,
    this.mobileMaxWidth = 999,
    this.tabletMaxWidth = 1199,
  });

  final ResponsiveBuilder builder;
  final double mobileMaxWidth;
  final double tabletMaxWidth;

  @override
  State<ResponsiveSizeChangeBuilder> createState() =>
      _ResponsiveSizeChangeBuilderState();
}

class _ResponsiveSizeChangeBuilderState
    extends State<ResponsiveSizeChangeBuilder>
    with WidgetsBindingObserver {
  late ResponsiveSize _currentSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _currentSize = _resolveSize(_windowWidth);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final nextSize = _resolveSize(_windowWidth);

    if (nextSize != _currentSize) {
      setState(() {
        _currentSize = nextSize;
      });
    }
  }

  double get _windowWidth {
    if (WidgetsBinding.instance.platformDispatcher.views.isEmpty) return 0.0;
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    return view.physicalSize.width / view.devicePixelRatio;
  }

  ResponsiveSize _resolveSize(double width) {
    if (width <= widget.mobileMaxWidth) {
      return ResponsiveSize.mobile;
    }
    if (width <= widget.tabletMaxWidth) {
      return ResponsiveSize.tablet;
    }
    return ResponsiveSize.desktop;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _currentSize);
  }
}