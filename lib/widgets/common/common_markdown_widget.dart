import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class CommonMarkdown extends StatelessWidget {
  const CommonMarkdown({
    super.key,
    required this.data,
    required this.padding,
    this.shrinkWrap = false,
    this.pTextColor,
  });

  final String data;
  final EdgeInsets padding;
  final bool shrinkWrap;
  final Color? pTextColor;

  @override
  Widget build(BuildContext context) {
    return MarkdownWidget(
      data: data,
      padding: padding,
      shrinkWrap: shrinkWrap,
      config: MarkdownConfig(
        configs: [
          _H1(context),
          _H2(context),
          PConfig(
            textStyle: TextStyle(
              height: 1.6,
              fontSize: 16,
              letterSpacing: 0.4,
              color: pTextColor ?? context.textColor,
            ),
          ),
          LinkConfig(
            style: TextStyle(
              height: 1.6,
              fontSize: 16,
              letterSpacing: 0.4,
              color: context.textColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class _H1 implements HeadingConfig {
  _H1(this.context);

  final BuildContext context;

  @override
  TextStyle get style => h1.copyWith(
    color: context.textColor,
    fontFamily: context.whenLanguage(
      en: () => AppConstants.primaryFont,
      ru: () => AppConstants.secondaryFont,
    ),
  );

  @override
  String get tag => MarkdownTag.h1.name;

  @override
  HeadingDivider? get divider => DummyDivider;

  @override
  EdgeInsets get padding => const EdgeInsets.only(top: 42);
}

class _H2 implements HeadingConfig {
  _H2(this.context);

  final BuildContext context;

  @override
  TextStyle get style => h2.copyWith(color: context.textColor);

  @override
  String get tag => MarkdownTag.h2.name;

  @override
  HeadingDivider? get divider => DummyDivider;

  @override
  EdgeInsets get padding => const EdgeInsets.only(bottom: 32, top: 6);
}

final DummyDivider = HeadingDivider(
  color: Colors.transparent,
  height: 0.0,
  space: 0.0,
);
