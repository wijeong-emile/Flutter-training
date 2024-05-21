import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ZimpleWidgets {
  /// styleRule사용 시 TextStyle에 사용되는 모든 값이 무효화 됩니다.
  static Widget zText(String text, {
    Color? color,
    bool useBold = false,
    double? letterSpacing = 0,
    double fontSize = 15,
    FontWeight? fontWeight,
    String? fontFamily,
    TextAlign? textAlign,
    double? height,

  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          height: height,
          fontSize: fontSize,
          color: color ?? const Color(0xFF212123),
          fontFamily: fontFamily,
          fontWeight:
          fontWeight ?? (useBold ? FontWeight.bold : FontWeight.normal),
          letterSpacing: letterSpacing),
    );
  }

  static Widget zTextButton(String text,
      {VoidCallback? onPressed,
        double? width,
        double? height,
        EdgeInsetsGeometry? margin,
        EdgeInsetsGeometry? padding,
        Color? backgroundColor,
        Color? textColor,
        String? fontFamily,
        double borderRadius = 8,
        double fontSize = 15,
        double? textHeight,
        FontWeight? fontWeight,
        TextAlign? textAlign,
        double sideWidth = 0,
        Color? sideColor,
        bool useBold = false,
        double? letterSpacing = 0}) {
    Color backColor = backgroundColor ?? const Color(0xff36324a);
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(padding),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: BorderSide(
                    width: sideWidth, color: sideColor ?? backColor),
              )),
          backgroundColor: MaterialStateProperty.all(backColor),
        ),
        child: zText(text,
            color: textColor,
            textAlign: textAlign,
            fontSize: fontSize,
            useBold: useBold,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing),
      ),
    );
  }

  static Widget zInkButton({double? width,
    double? height,
    required VoidCallback onTap,
    double borderRadius = 8,
    Color? backgroundColor,
    Gradient? gradient,
    BoxShape? boxShape,
    EdgeInsetsGeometry? padding,
    Widget? child,
    double sideWidth = 0,
    Color? sideColor,
    MaterialStateProperty<Color?>? overlayColor,
    Color? splashColor,
    Color? highlightColor}) {
    BorderRadius? conner;
    if (borderRadius != 0) {
      conner = BorderRadius.circular(borderRadius);
    }
    return InkWell(
      borderRadius: conner,
      onTap: onTap,
      // highlightColor: Color(0xFF4755FF),
      splashColor: splashColor,
      highlightColor: highlightColor,
      overlayColor: overlayColor,
      child: Ink(
        decoration: BoxDecoration(
            color: backgroundColor,
            gradient: gradient,
            borderRadius: conner,
            border: Border.all(
                color: sideColor ?? Colors.transparent, width: sideWidth),
            shape: boxShape ?? BoxShape.rectangle),
        padding: padding,
        width: width,
        height: height,
        child: child,
      ),
    );
  }

  static Widget zContainer({double? width,
    double? height,
    BoxConstraints? boxConstraints,
    Color? backgroundColor,
    Gradient? gradient,
    double borderRadius = 0,
    double sideWidth = 0,
    BorderRadiusGeometry? borderRadiusGeometry,
    Color? sideColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    BoxShape? boxShape,
    AlignmentGeometry? alignment,
    Clip clipBehavior = Clip.none,
    Widget? child}) {
    BorderRadiusGeometry? conner;
    if (borderRadius != 0) {
      conner = BorderRadius.circular(borderRadius);
    }
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      clipBehavior: clipBehavior,
      constraints: boxConstraints,
      decoration: BoxDecoration(
          color: backgroundColor,
          gradient: gradient,
          borderRadius: borderRadiusGeometry ?? conner,
          border: sideWidth != 0 ? Border.all(
              color: sideColor ?? const Color(0x000000ff), width: sideWidth):null,
          shape: boxShape ?? BoxShape.rectangle),
      child: child,
    );
  }

  static Widget zHorizonDivider({required double height,
    required Color color,
    EdgeInsetsGeometry? margin}) {
    return Container(
      height: height,
      color: color,
      margin: margin,
    );
  }

  static Widget zImageAsset(String fileName,
      {double? width, double? height, BoxFit? boxFit, bool notPNG = false}) {
    String useblePNG = notPNG ? '' : '.png';
    return Image.asset(
      'assets/$fileName$useblePNG',
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.contain,
    );
  }

  static Widget zSvgImage(String assetName,
      {double? width,
        double? height,
        BoxFit? boxFit,
        Color? color,
        BlendMode? blendMode,
        ColorFilter? colorFilter}) {
    return SvgPicture.asset(
      'assets/$assetName.svg',
      colorFilter: color == null
          ? colorFilter
          : ColorFilter.mode(color, blendMode ?? BlendMode.srcIn),
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.contain,
    );
  }

  static Widget zSvgNetImage(String imageUrl,
      {double? width,
        double? height,
        BoxFit? boxFit,
        Color? color,
        BlendMode? blendMode,
        ColorFilter? colorFilter}) {
    return SvgPicture.network(
      imageUrl,
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.contain,
    );
  }

  static Widget zNetworkImage({
    required String url,
    double? width,
    double? height,
    BoxFit? boxFit,
    bool useCash = true,
    BoxBorder? boxBorder,
    BorderRadius? borderRadius,
    Clip? clip,
    double loadingSize = 100,
    LoadStateChanged? loadStateChanged,
  }) {
    String errorImageAssets = 'common_ico_warning';
    if(url.startsWith('ipfs://')){
      url = url.replaceAll('ipfs://', 'https://ipfs.io/ipfs/');
    }
    return ExtendedImage.network(
      url,
      width: width,
      height: height,
      fit: boxFit,
      cache: useCash,
      clipBehavior: clip ?? Clip.antiAlias,
      border: boxBorder,
      borderRadius: borderRadius,
      timeLimit: const Duration(seconds: 3),
      loadStateChanged: loadStateChanged ??
              (ExtendedImageState state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                return const Center(child: CircularProgressIndicator(color: Colors.white,));
              case LoadState.completed:
                return state.completedWidget;
              case LoadState.failed:
                return GestureDetector(
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Center(
                        child:
                        zSvgImage(errorImageAssets, width: 50, height: 50),
                      ),
                    ],
                  ),
                  // onTap: () {
                  //   state.reLoadImage();
                  // },
                );
            }
          },
    );
  }

  // static Widget lottieAnimation({
  //   required String assetName,
  //   double width = 100,
  //   double height = 100,
  // }) {
  //   return Lottie.asset('assets/$assetName.json', width: width, height: height);
  // }
}
