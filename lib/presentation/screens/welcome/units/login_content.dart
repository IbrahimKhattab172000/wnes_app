part of "../view.dart";

class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.height),
        Image.asset(
          Utils.getAssetPNGPath("welcome"),
        ),
        SizedBox(height: 38.height),
        AppText(
          title: "wnes".tr(),
          color: AppColors.primary,
          fontSize: 40,
          fontWeight: FontWeight.w900,
        ),
        AppText(
          title: "your_kid_safe_always".tr(),
          color: AppColors.black,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 16.height),
        AppText(
          title: "search_for_the_perfect_encubator".tr(),
          color: AppColors.gray,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32.height),
        AppButton(
          title: "new_user".tr(),
          onTap: () => RouteUtils.navigateTo(const LoginView()),
          linearColor: true,
        ),
        SizedBox(height: 16.height),
        AppButton.outline(
          title: "login".tr(),
          titleColor: AppColors.black,
          onTap: () {},
        ),
        SizedBox(height: 32.height),
        AppText(
          title: "skip".tr(),
          color: AppColors.primary,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: Utils.bottomDevicePadding),
      ],
    );
  }
}
