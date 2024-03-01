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

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/ic_close_modal.svg
  SvgGenImage get icCloseModal =>
      const SvgGenImage('assets/svg/ic_close_modal.svg');

  /// File path: assets/svg/ic_default_bg.svg
  SvgGenImage get icDefaultBg =>
      const SvgGenImage('assets/svg/ic_default_bg.svg');

  /// File path: assets/svg/ic_failure.svg
  SvgGenImage get icFailure => const SvgGenImage('assets/svg/ic_failure.svg');

  /// File path: assets/svg/ic_home_menu.svg
  SvgGenImage get icHomeMenu =>
      const SvgGenImage('assets/svg/ic_home_menu.svg');

  /// File path: assets/svg/ic_naira.svg
  SvgGenImage get icNaira => const SvgGenImage('assets/svg/ic_naira.svg');

  /// File path: assets/svg/ic_received.svg
  SvgGenImage get icReceived => const SvgGenImage('assets/svg/ic_received.svg');

  /// File path: assets/svg/ic_sec_splash_bg.svg
  SvgGenImage get icSecSplashBg =>
      const SvgGenImage('assets/svg/ic_sec_splash_bg.svg');

  /// File path: assets/svg/ic_sent.svg
  SvgGenImage get icSent => const SvgGenImage('assets/svg/ic_sent.svg');

  /// File path: assets/svg/ic_splash_bg.svg
  SvgGenImage get icSplashBg =>
      const SvgGenImage('assets/svg/ic_splash_bg.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icCloseModal,
        icDefaultBg,
        icFailure,
        icHomeMenu,
        icNaira,
        icReceived,
        icSecSplashBg,
        icSent,
        icSplashBg
      ];
}

class FinTechMobileTaskAssets {
  FinTechMobileTaskAssets._();

  static const $AssetsSvgGen svg = $AssetsSvgGen();
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
