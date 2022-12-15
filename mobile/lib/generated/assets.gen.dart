/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsAppGen get app => const $AssetsIconsAppGen();
  $AssetsIconsAuthGen get auth => const $AssetsIconsAuthGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesBackgroundGen get background =>
      const $AssetsImagesBackgroundGen();
  $AssetsImagesSnackbarGen get snackbar => const $AssetsImagesSnackbarGen();
}

class $AssetsLocalesGen {
  const $AssetsLocalesGen();

  /// File path: assets/locales/en_US.json
  String get enUS => 'assets/locales/en_US.json';

  /// File path: assets/locales/vi_VN.json
  String get viVN => 'assets/locales/vi_VN.json';
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/error_alert.json
  String get errorAlert => 'assets/lotties/error_alert.json';
}

class $AssetsSecureGen {
  const $AssetsSecureGen();

  /// File path: assets/secure/.env
  String get env => 'assets/secure/.env';
}

class $AssetsIconsAppGen {
  const $AssetsIconsAppGen();

  /// File path: assets/icons/app/app_icon.png
  AssetGenImage get appIconPng =>
      const AssetGenImage('assets/icons/app/app_icon.png');

  /// File path: assets/icons/app/app_icon.svg
  SvgGenImage get appIconSvg =>
      const SvgGenImage('assets/icons/app/app_icon.svg');
}

class $AssetsIconsAuthGen {
  const $AssetsIconsAuthGen();

  /// File path: assets/icons/auth/apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/icons/auth/apple.svg');

  /// File path: assets/icons/auth/facebook.svg
  SvgGenImage get facebook =>
      const SvgGenImage('assets/icons/auth/facebook.svg');

  /// File path: assets/icons/auth/google.svg
  SvgGenImage get google => const SvgGenImage('assets/icons/auth/google.svg');

  /// File path: assets/icons/auth/lock.svg
  SvgGenImage get lock => const SvgGenImage('assets/icons/auth/lock.svg');

  /// File path: assets/icons/auth/mail.svg
  SvgGenImage get mail => const SvgGenImage('assets/icons/auth/mail.svg');
}

class $AssetsImagesBackgroundGen {
  const $AssetsImagesBackgroundGen();

  /// File path: assets/images/background/wave.svg
  SvgGenImage get wave =>
      const SvgGenImage('assets/images/background/wave.svg');
}

class $AssetsImagesSnackbarGen {
  const $AssetsImagesSnackbarGen();

  /// File path: assets/images/snackbar/back.svg
  SvgGenImage get back => const SvgGenImage('assets/images/snackbar/back.svg');

  /// File path: assets/images/snackbar/bubbles.svg
  SvgGenImage get bubbles =>
      const SvgGenImage('assets/images/snackbar/bubbles.svg');

  /// File path: assets/images/snackbar/failure.svg
  SvgGenImage get failure =>
      const SvgGenImage('assets/images/snackbar/failure.svg');

  /// File path: assets/images/snackbar/help.svg
  SvgGenImage get help => const SvgGenImage('assets/images/snackbar/help.svg');

  /// File path: assets/images/snackbar/success.svg
  SvgGenImage get success =>
      const SvgGenImage('assets/images/snackbar/success.svg');

  /// File path: assets/images/snackbar/warning.svg
  SvgGenImage get warning =>
      const SvgGenImage('assets/images/snackbar/warning.svg');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalesGen locales = $AssetsLocalesGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
  static const $AssetsSecureGen secure = $AssetsSecureGen();
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
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
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
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
