import 'package:flutter/material.dart';
import 'package:goal_hup/core/helper/get_responsive_font_size.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';

class AppTextStyles {
  static TextStyle title20WhiteW500 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontWeight: FontWeight.w500,
  );
  static TextStyle title16GreyW500 = TextStyle(
    color: Colors.grey,
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.w500,
  );
  static TextStyle title16Black = TextStyle(
    color: Colors.black,
    fontSize: getResponsiveFontSize(fontSize: 16),
  );

  static TextStyle title14Grey = TextStyle(
    color: Colors.grey.withOpacity(0.5),
    fontSize: getResponsiveFontSize(fontSize: 14),
  );

  static TextStyle title24WhiteW500 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 24),
    fontWeight: FontWeight.w500,
  );

  static TextStyle title28WhiteW500 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 28),
    fontWeight: FontWeight.w500,
  );
  static TextStyle title42WhiteW500 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 42),
    fontWeight: FontWeight.w500,
  );

  static TextStyle title16White300 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.w300,
  );
  static TextStyle title18White = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 18),
  );
  static TextStyle title18Black = TextStyle(
    color: Colors.black,
    fontSize: getResponsiveFontSize(fontSize: 18),
  );

  static TextStyle title20WhiteBold = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontWeight: FontWeight.bold,
  );

  static TextStyle title16White500 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.w500,
  );

  static TextStyle title28PrimaryColorW500 = TextStyle(
    color: AppColors.kPrimaryColor,
    fontSize: getResponsiveFontSize(fontSize: 28),
    fontWeight: FontWeight.w500,
  );
  static TextStyle title28WhiteColorW500 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 28),
    fontWeight: FontWeight.w500,
  );

  static TextStyle title14PrimaryColorW400 = TextStyle(
    color: AppColors.kPrimaryColor,
    fontSize: getResponsiveFontSize(fontSize: 14),
    fontWeight: FontWeight.w400,
  );
    static TextStyle title16PrimaryColorWithOpacity = TextStyle(
    color: AppColors.kPrimaryColor.withOpacity(0.8),
    fontSize: getResponsiveFontSize(fontSize: 16),
  );

  static TextStyle title16PrimaryColorW500 = TextStyle(
    color: AppColors.kPrimaryColor,
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.w500,
  );
  static TextStyle title18PrimaryColorW500 = TextStyle(
    color: AppColors.kPrimaryColor,
    fontSize: getResponsiveFontSize(fontSize: 18),
    fontWeight: FontWeight.w500,
  );
  static TextStyle title20PrimaryColorWithOpacity = TextStyle(
    color: AppColors.kPrimaryColor.withOpacity(0.85),
    fontSize: getResponsiveFontSize(fontSize: 20),
  );

  static TextStyle title16SecondaryColorW500 = TextStyle(
    color: AppColors.kPrimaryColor,
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.w500,
  );

  static TextStyle title24PrimaryColorW500 = TextStyle(
    color: AppColors.kPrimaryColor,
    fontSize: getResponsiveFontSize(fontSize: 24),
    fontWeight: FontWeight.w500,
  );

  static TextStyle title20PrimaryColorW500 = TextStyle(
    color: AppColors.kPrimaryColor,
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontWeight: FontWeight.w500,
  );
  
}
