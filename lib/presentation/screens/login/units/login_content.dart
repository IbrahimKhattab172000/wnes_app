part of "../view.dart";

class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 30.height),
            Image.asset(
              Utils.getAssetPNGPath("login"),
            ),
            SizedBox(height: 40.height),
            AppText(
              title: "login".tr(),
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
            SizedBox(height: 24.height),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ThirdPartyLoginWidget(
                  imagePath: "google",
                  color: AppColors.green,
                ),
                ThirdPartyLoginWidget(
                  imagePath: "facebook",
                  color: AppColors.blue,
                ),
              ],
            ),
            SizedBox(height: 24.height),
            _textDivider(text: "or".tr()),
            SizedBox(height: 24.height),
            AppTextField(
              borderColor: AppColors.border,
              label: "phone_number".tr(),
              hint: "enter_the_number".tr(),
              trailing: AppCountryPicker(
                onSelect: (String country, String code) {},
              ),
            ),
            SizedBox(height: 24.height),
            AppTextField(
              borderColor: AppColors.border,
              label: "password".tr(),
              hint: "enter_the_password".tr(),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye_outlined),
              ),
            ),
            SizedBox(height: 8.height),
            Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                title: "forget_password".tr(),
                color: AppColors.gray,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 32.height),
            AppButton(
              title: "pick_up_location".tr(),
              onTap: () {},
              linearColor: true,
            ),
            SizedBox(height: 32.height),
            AppButton(
              title: "login".tr(),
              onTap: () {},
              linearColor: true,
            ),
            SizedBox(height: 24.height),
            AppText(
              title: "skip".tr(),
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Utils.bottomDevicePadding),
          ],
        ),
      ),
    );
  }
}

class ThirdPartyLoginWidget extends StatelessWidget {
  final String imagePath;
  final Color color;
  const ThirdPartyLoginWidget({
    super.key,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.height,
      width: 154.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        border: Border.all(
          width: 1,
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            Utils.getAssetPNGPath(imagePath),
          ),
          SizedBox(width: 8.width),
          AppText(
            title: "continue".tr(),
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: color,
          )
        ],
      ),
    );
  }
}

_textDivider({
  required String text,
  Color textColor = AppColors.green,
}) {
  return Row(
    children: [
      const Expanded(
        child: Divider(
          thickness: 1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      const Expanded(
        child: Divider(
          thickness: 1,
          color: AppColors.border,
        ),
      ),
    ],
  );
}
