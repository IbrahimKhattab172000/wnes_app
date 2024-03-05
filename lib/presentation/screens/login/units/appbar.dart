part of "../view.dart";

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => RouteUtils.pop(),
          icon: Container(
            height: 44.height,
            width: 44.width,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 16,
            ),
          ),
        ),
        Image.asset(
          Utils.getAssetPNGPath("app_logo_icon"),
          height: 44.height,
          width: 44.width,
        ),
      ],
    );
  }
}
