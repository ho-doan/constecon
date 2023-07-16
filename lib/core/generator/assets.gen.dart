/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/back-bg.svg
  SvgGenImage get backBg => const SvgGenImage('assets/icon/back-bg.svg');

  /// File path: assets/icon/back.svg
  SvgGenImage get back => const SvgGenImage('assets/icon/back.svg');

  /// File path: assets/icon/background_intro.svg
  SvgGenImage get backgroundIntro =>
      const SvgGenImage('assets/icon/background_intro.svg');

  /// File path: assets/icon/building.svg
  SvgGenImage get building => const SvgGenImage('assets/icon/building.svg');

  /// File path: assets/icon/ic_more.svg
  SvgGenImage get icMore => const SvgGenImage('assets/icon/ic_more.svg');

  /// File path: assets/icon/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/icon/logo.svg');

  /// File path: assets/icon/logo_grid.png
  AssetGenImage get logoGrid =>
      const AssetGenImage('assets/icon/logo_grid.png');

  /// File path: assets/icon/next-bg.svg
  SvgGenImage get nextBg => const SvgGenImage('assets/icon/next-bg.svg');

  /// File path: assets/icon/next.svg
  SvgGenImage get next => const SvgGenImage('assets/icon/next.svg');

  /// File path: assets/icon/option.svg
  SvgGenImage get option => const SvgGenImage('assets/icon/option.svg');

  /// File path: assets/icon/point.png
  AssetGenImage get point => const AssetGenImage('assets/icon/point.png');

  /// File path: assets/icon/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icon/search.svg');

  /// List of all assets
  List<dynamic> get values => [
        backBg,
        back,
        backgroundIntro,
        building,
        icMore,
        logo,
        logoGrid,
        nextBg,
        next,
        option,
        point,
        search
      ];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/background_grid.png
  AssetGenImage get backgroundGrid =>
      const AssetGenImage('assets/image/background_grid.png');

  /// File path: assets/image/elementor-slides-wrapper.png
  AssetGenImage get elementorSlidesWrapper =>
      const AssetGenImage('assets/image/elementor-slides-wrapper.png');

  /// File path: assets/image/product-person.png
  AssetGenImage get productPerson =>
      const AssetGenImage('assets/image/product-person.png');

  /// File path: assets/image/product.png
  AssetGenImage get product => const AssetGenImage('assets/image/product.png');

  /// File path: assets/image/product_some_person.png
  AssetGenImage get productSomePerson =>
      const AssetGenImage('assets/image/product_some_person.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        backgroundGrid,
        elementorSlidesWrapper,
        productPerson,
        product,
        productSomePerson
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
