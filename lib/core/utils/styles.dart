import 'package:flutter/material.dart';

import '../generator/colors.gen.dart';
import 'extensions.dart';

class AppTextStyle {
  AppTextStyle._internal();
  static TextStyle get _baseTextStyle => TextStyle(
        // fontFamily: FontFamily.beVietNamPro,
        color: AppColors.primaryColor,
        fontStyle: FontStyle.normal,
        fontSize: 16.sf,
        fontWeight: FontWeight.w400,
        height: 28.sf.textHeight(16.sf),
      );

  static TextStyle get normal => _baseTextStyle.copyWith(
        color: AppColors.neutralGreenColor,
        fontSize: 14.sf,
        height: 24.sf.textHeight(14.sf),
      );
}

extension VTextStyle on TextStyle {
  TextStyle cp({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
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
    String? fontFamily,
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
        height:
            // height != null ? height.sf.textHeight(fontSize ?? 14.sf) : height,
            (height ?? this.height ?? this.fontSize ?? this.fontSize ?? 14)
                .textHeight(fontSize ?? this.fontSize ?? 14),
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
        // fontFamily: fontFamily ??
        //     (fontWeight == FontWeight.w700
        //         ? FontFamily.beVietNamProBold
        //         : FontFamily.beVietNamPro),
        fontFamilyFallback: fontFamilyFallback,
        package: package,
        overflow: overflow,
      );
}
