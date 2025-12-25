import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:factlyapp_landing/localization/locale_keys.g.dart';
import 'package:factlyapp_landing/widgets/common/common_fading_edge_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_markdown_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_scaffold_widget.dart';
import 'package:factlyapp_landing/widgets/common/common_terms_privacy_app_bar_widget.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final markdownPadding = const EdgeInsets.all(
      32,
    ).copyWith(bottom: 96 + bottomPadding);

    return CommonScaffold(
      body: Column(
        children: [
          CommonAppBar(title: context.tr(LocaleKeys.label_terms_of_use)),
          Expanded(
            child: CommonFadingEdge(
              axis: Axis.vertical,
              child:
                  CommonMarkdown(
                    data: context.tr(LocaleKeys.terms_of_use),
                    padding: markdownPadding,
                  ).fadeInUp(
                    from: 50,
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: const Duration(milliseconds: 1000),
                    delay: const Duration(milliseconds: 200),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
