import 'package:animate_do/animate_do.dart';
import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:factlyapp_landing/routes/router.dart';
import 'package:factlyapp_landing/theme/app_theme.dart';
import 'package:factlyapp_landing/widgets/common/common_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({super.key});

  static const title = '  404 :(';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(Routes.home),
      child: CommonScaffold(
        body: Center(
          child:
              Text(
                    title,
                    style: TextStyle(
                      fontSize: 48,
                      color: context.textColor,
                      fontFamily: AppConstants.primaryFont,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 4,
                    ),
                  )
                  .elasticIn(delay: const Duration(milliseconds: 400))
                  .rubberBand(
                    curve: Curves.easeInOutCirc,
                    delay: const Duration(milliseconds: 2000),
                    duration: const Duration(milliseconds: 4000),
                  ),
        ),
      ),
    );
  }
}
