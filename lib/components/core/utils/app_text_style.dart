import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

double getScaletFactor(BuildContext context)
{
  double widthscreen = MediaQuery.of(context).size.width;

  if( widthscreen <= 600 )
  {
    return widthscreen/750;
  }else if( widthscreen <= 1200 )
  {
    return widthscreen/900;
  }
  else
  {
    return widthscreen / 1750;
  }
}

double getResponsiveScaleFactor(
  BuildContext context,
  {
    required double fontSize,
  }
) {
  double ScaletFactor = getScaletFactor(context);
  double responsiveFontSize = fontSize * ScaletFactor;

  double lowerLimit = responsiveFontSize * 0.8; // momkn y2l 3n 7agm el 5at bnsbt 80%
  double upperLimit = responsiveFontSize * 0.8; // momkn yzyd 3n 7agm el 5at bnsbt 120%

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

abstract class AppTextStyles {
  static TextStyle style46w700(BuildContext context) {
    return TextStyle(
      fontFamily: 'Almarai',
      fontSize:  getResponsiveScaleFactor(context, fontSize: 46),
      fontWeight: FontWeight.w700,
      color: AppColors.White,
    );
  }
  static TextStyle style32w700(BuildContext context) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: getResponsiveScaleFactor(context, fontSize: 32),
      fontWeight: FontWeight.w700,
      color: AppColors.BabyGrey,
    );
  }
  static TextStyle style18w400(BuildContext context) {
    return TextStyle(
      fontFamily: 'Tajawal',
      fontSize: getResponsiveScaleFactor(context, fontSize: 18),
      fontWeight: FontWeight.w400,
      color: AppColors.BabyBlack,
    );
  }

  static TextStyle style20w400(BuildContext context) {
    return TextStyle(
      fontFamily: 'Almarai',
      fontSize: getResponsiveScaleFactor(context, fontSize: 20),
      fontWeight: FontWeight.w400,
      color: AppColors.White,
    );
  }
  static TextStyle style24w700(BuildContext context) {
    return TextStyle(
      fontFamily: 'Tajawal',
      fontSize: getResponsiveScaleFactor(context, fontSize: 24),
      fontWeight: FontWeight.w700,
      color: AppColors.BabyBlack,
    );
  }
  static TextStyle style24w500(BuildContext context) {
    return TextStyle(
      fontFamily: 'Noto_Kufi_Arabic',
      fontSize: getResponsiveScaleFactor(context, fontSize: 24),
      fontWeight: FontWeight.w500,
      color: AppColors.BabyBlack,
    );
  }
  static TextStyle style24w400(BuildContext context) {
    return TextStyle(
      fontFamily: 'Almarai',
      fontSize: getResponsiveScaleFactor(context, fontSize: 24),
      fontWeight: FontWeight.w400,
      color: AppColors.BabyBlack,
    );
  }
  static TextStyle style22w700(BuildContext context) {
    return TextStyle(
      fontFamily: 'Noto_Kufi_Arabic',
      fontSize: getResponsiveScaleFactor(context, fontSize: 22),
      fontWeight: FontWeight.w700,
      color: AppColors.BiggerthanBabyBlack,
    );
  }
  static TextStyle style18w500(BuildContext context) {
    return TextStyle(
      fontFamily: "Noto_Kufi_Arabic",
      fontSize: getResponsiveScaleFactor(context, fontSize: 18),
      fontWeight: FontWeight.w500,
      color: AppColors.Grey,
    );
  }
  static TextStyle style20w700(BuildContext context) {
    return TextStyle(
      fontFamily: "Noto_Kufi_Arabic",
      fontSize: getResponsiveScaleFactor(context, fontSize: 20),
      fontWeight: FontWeight.w700,
      color: AppColors.BiggerthanBabyBlack,
    );
  }
  static TextStyle style16w600(BuildContext context) {
    return TextStyle(
      fontFamily: "Noto_Kufi_Arabic",
      fontSize: getResponsiveScaleFactor(context, fontSize: 18),
      fontWeight: FontWeight.w600,
      color: AppColors.SmallerThanTheBigger,
    );
  }
  static TextStyle style16w500(BuildContext context) {
    return TextStyle(
      fontFamily: "Noto_Kufi_Arabic",
      fontSize: getResponsiveScaleFactor(context, fontSize: 16),
      fontWeight: FontWeight.w500,
      color: AppColors.Violet_Blue,
    );
  }
  static TextStyle style14w500(BuildContext context) {
    return TextStyle(
      fontFamily: "Noto_Kufi_Arabic",
      fontSize: getResponsiveScaleFactor(context, fontSize: 14),
      fontWeight: FontWeight.w500,
      color: AppColors.Grey,
    );
  }
  static TextStyle style14w400(BuildContext context) {
    return TextStyle(
      fontFamily: "Almarai",
      fontSize: getResponsiveScaleFactor(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      color: AppColors.BabyBlack,
    );
  }
  static TextStyle style16w400(BuildContext context) {
    return TextStyle(
      fontFamily: "Noto_Kufi_Arabic",
      fontSize: getResponsiveScaleFactor(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      color: AppColors.Black,
    );
  }
  static TextStyle style22w400(BuildContext context) {
    return TextStyle(
      fontFamily: "Almarai",
      fontSize: getResponsiveScaleFactor(context, fontSize: 22),
      fontWeight: FontWeight.w400,
      color: AppColors.BabyBlack,
    );
  }
  static TextStyle style8w400(BuildContext context) {
    return TextStyle(
      fontFamily: "Almarai",
      fontSize: getResponsiveScaleFactor(context, fontSize: 8),
      fontWeight: FontWeight.w400,
      color: AppColors.BabyBlack,
    );
  }
}