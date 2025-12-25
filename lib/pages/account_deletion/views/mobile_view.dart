part of 'package:factlyapp_landing/pages/account_deletion/account_deletion_page.dart';

class _MobileView extends StatelessWidget {
  const _MobileView(this.constraints);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final phoneMockupHeight = constraints.maxHeight * 0.48;
    final imagePath = context.isLightTheme
        ? AppAssets.accountDeletionLight
        : AppAssets.accountDeletionDark;

    return Column(
      children: [
        const CommonAppBar(title: AccountDeletionPage.appBarTitle),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: topPadding),
              const SizedBox(height: 42),
              SizedBox(
                width: double.infinity,
                height: phoneMockupHeight,
                child: Image.asset(imagePath),
              ),
              const SizedBox(height: 42),
              Center(
                child:
                    Text(
                      AccountDeletionPage.stepsTitle,
                      style: h0.copyWith(
                        fontSize: 24,
                        color: context.textColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ).fadeInUp(
                      curve: Curves.linearToEaseOut,
                      duration: const Duration(milliseconds: 1200),
                    ),
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
              const SizedBox(height: 42),
            ],
          ),
        ),
      ],
    );
  }
}
