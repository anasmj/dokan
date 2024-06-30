/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/d.png
  AssetGenImage get d => const AssetGenImage('assets/png/d.png');

  /// File path: assets/png/dokan.png
  AssetGenImage get dokan => const AssetGenImage('assets/png/dokan.png');

  /// List of all assets
  List<AssetGenImage> get values => [d, dokan];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/cart.svg
  String get cart => 'assets/svg/cart.svg';

  /// File path: assets/svg/dokan.svg
  String get dokan => 'assets/svg/dokan.svg';

  /// File path: assets/svg/facebook.svg
  String get facebook => 'assets/svg/facebook.svg';

  /// File path: assets/svg/google.svg
  String get google => 'assets/svg/google.svg';

  /// File path: assets/svg/grid.svg
  String get grid => 'assets/svg/grid.svg';

  /// File path: assets/svg/home.svg
  String get home => 'assets/svg/home.svg';

  /// File path: assets/svg/undraw.svg
  String get undraw => 'assets/svg/undraw.svg';

  /// File path: assets/svg/user.svg
  String get user => 'assets/svg/user.svg';

  /// File path: assets/svg/user_outline.svg
  String get userOutline => 'assets/svg/user_outline.svg';

  /// List of all assets
  List<String> get values =>
      [cart, dokan, facebook, google, grid, home, undraw, user, userOutline];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const String response = 'assets/response.json';
  static const $AssetsSvgGen svg = $AssetsSvgGen();

  /// List of all assets
  static List<String> get values => [response];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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
