import 'package:flutter/material.dart';

import '../generator/colors.gen.dart';
import 'extensions.dart';

class AppTextStyle {
  AppTextStyle._internal();
  static TextStyle get _baseTextStyle => TextStyle(
        // fontFamily: FontFamily.beVietNamPro,
        color: AppColors.primaryColor,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 28.textHeight(16),
      );

  static TextStyle get normal => _baseTextStyle.copyWith(
        color: AppColors.neutralGreenColor,
        fontSize: 14,
        height: 24.textHeight(14),
      );
}

extension VTextStyle on TextStyle {
  TextStyle cp({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    // ui.TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    // List<ui.Shadow>? shadows,
    // List<ui.FontFeature>? fontFeatures,
    // List<ui.FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    List<String>? fontFamilyFallback,
    String? package,
    TextOverflow? overflow,
  }) =>
      copyWith(
        inherit: inherit,
        color: color,
        backgroundColor: backgroundColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        height: height != null ? 0 : null,
        // height != null ? height.sf.textHeight(fontSize ?? 14.sf) : height,
        // (this.height ?? fontSize ?? 14).textHeight(fontSize ?? 14),
        leadingDistribution: leadingDistribution,
        locale: locale,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        fontVariations: fontVariations,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        debugLabel: debugLabel,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        overflow: overflow,
      );
  TextStyle get rmHeight => copyWith(height: 0);
}
