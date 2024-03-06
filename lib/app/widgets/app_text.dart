import 'package:flutter/material.dart';
import 'package:wnes_app/business_logic/helpers/colors.dart';

class AppText extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final double? height;
  final String? fontFamily;
  final EdgeInsetsGeometry padding;
  final void Function()? onTap;

  const AppText({
    super.key,
    required this.title,
    this.color = AppColors.gray,
    this.fontSize = 16,
    this.textAlign,
    this.decoration,
    this.overflow,
    this.fontWeight = FontWeight.w400,
    this.maxLines,
    this.height,
    this.fontFamily,
    this.softWrap,
    this.padding = EdgeInsets.zero,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          textAlign: textAlign ?? TextAlign.start,
          textScaler: const TextScaler.linear(1),
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            height: height != null ? height! / fontSize : null,
            decoration: decoration ?? TextDecoration.none,
            decorationStyle: TextDecorationStyle.solid,
            decorationColor: color,
            fontWeight: fontWeight,
            fontFamily: fontFamily ?? "Tajawal",
          ),
          overflow: overflow,
          maxLines: maxLines,
          softWrap: softWrap,
        ),
      ),
    );
  }
}
