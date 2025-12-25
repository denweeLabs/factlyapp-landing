import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadeSlideupPage<T> extends CustomTransitionPage<T> {
  FadeSlideupPage({required super.child, super.key})
    : super(
        transitionDuration: const Duration(milliseconds: 700),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: const Interval(0.0, 0.6, curve: Curves.ease),
              reverseCurve: Curves.easeInOutQuint,
            ),
          );

          final slide =
              Tween<Offset>(
                begin: const Offset(0.0, 0.12),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastEaseInToSlowEaseOut,
                  reverseCurve: Curves.ease,
                ),
              );

          return SlideTransition(
            position: slide,
            child: FadeTransition(opacity: fade, child: child),
          );
        },
      );
}
