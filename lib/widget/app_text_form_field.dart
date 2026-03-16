import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_constants.dart';
import '../themes/extensions/theme_extension.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  final bool autoFocus;

  final Widget? prefix;

  final bool obscureText;

  final Widget? suffix;

  final Decoration? decoration;

  final void Function(String?)? onSaved;
  final Color? fillColor;
  final Color? inputColor;
  final Color? cursorColor;

  final bool hasFocusedBorder;
  final TextStyle? hintStyle;
  final void Function(String)? onFieldSubmitted;

  final String? initialValue;

  final BorderSide borderSide;
  final FocusNode? focusNode;

  final EdgeInsets? inputMargin;

  final TextInputType? keyboardType;

  final String? fontFamily;
  final double widthBorderSide;

  final bool hasEnabledBorderSide;

  final bool readonly;
  final FontStyle? inputFontStyle;
  final double? inputLetterSpacing;
  final TextInputAction? textInputAction;

  final void Function()? onTap;
  final EdgeInsets? contentPadding;

  final int? maxLines;

  final FontWeight? errorFontWeight;

  final double borderRadius;
  final double errorSize;

  final FontWeight? inputFontWeight;

  final Color? activeColor;
  final Color? focusedBorderColor;
  final double? inputSize;
  final void Function(String)? onChanged;
  final double? inputHeight;
  final TextStyle? inputTextStyle;

  final BorderSide errorBorderSide;

  final double horizontalPadding;

  // final EdgeInsets? textFieldMargin;

  final List<TextInputFormatter>? inputFormatters;

  final String? Function(String?)? validator;
  const AppTextField({
    Key? key,
    this.hintText = "",
    this.errorFontWeight = FontWeight.w400,
    this.controller,
    this.autoFocus = false,
    this.prefix,
    this.obscureText = false,
    this.suffix,
    this.decoration,
    this.onSaved,
    this.fillColor = Colors.transparent,
    this.onFieldSubmitted,
    this.borderSide = const BorderSide(
      width: 1.0,
      color: Color(
        0xFFE0E0E0,
      ),
    ),
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.cursorColor = const Color(
      0xFF7B57E4,
    ),
    this.inputColor,
    this.focusNode,
    this.readonly = false,
    this.inputFontWeight = FontWeight.w400,
    this.inputMargin,
    this.initialValue,
    this.maxLines = 1,
    this.hasEnabledBorderSide = true,
    this.onTap,
    this.borderRadius = 0,
    this.activeColor = const Color(
      0xFFE0E0E0,
    ),
    this.widthBorderSide = 1.0,
    this.inputSize = 0,
    this.inputFontStyle,
    this.hintStyle ,
    this.fontFamily = "manrope",
    this.inputLetterSpacing,
    this.inputHeight,
    this.errorBorderSide = const BorderSide(
      color: Color(
        0xFFFF6B61,
      ),
      width: 1.0,
    ),
    this.errorSize = 2,
    this.hasFocusedBorder = true,
    this.onChanged,
    this.horizontalPadding = 2,
    this.focusedBorderColor,
    this.contentPadding,
    this.inputTextStyle,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 54,

      decoration: decoration,
      // margin: EdgeInsets.symmetric(
      //   horizontal: horizontalPadding==2?:horizontalPadding,
      //   // vertical: 0,
      // ),
      child: TextFormField(
        readOnly: readonly,
        autofocus: autoFocus,

        onTap: onTap,
        onChanged: onChanged,
        focusNode: focusNode,
        textInputAction: textInputAction,
        // initialValue: initialValue,
        style: TextStyle(
          fontStyle: inputFontStyle,
          color: inputColor?? context.color.primaryText,
          fontFamily: fontFamily,
          letterSpacing: inputLetterSpacing,
          height: inputHeight,
          fontWeight: inputFontWeight,
          fontSize: inputSize == 0 ? 16 : inputSize,

          // height: 56,
        ),

        keyboardType: keyboardType,

        controller: controller,
        validator: validator,

        obscureText: obscureText,
        obscuringCharacter: "*",
        maxLines: maxLines,
        onSaved: onSaved,
        inputFormatters: inputFormatters,
        cursorColor: cursorColor,
        onFieldSubmitted: onFieldSubmitted,

        decoration: InputDecoration(
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
          errorStyle: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w500,
            height: 1.6,
            fontSize: errorSize == 2 ? 14 : errorSize,
            fontFamily: AppConstants.latoFont,
            // height: 56,
          ),
          fillColor: fillColor,
          filled: true,
          prefixIcon: prefix,
          hintText: hintText,
          suffixIcon: suffix,
          hintStyle: hintStyle??TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: context.color.mutedText,
          ),
          // contentPadding: EdgeInsets.symmetric(
          //   vertical: MobileDimensions.mobile48 / 4,
          //   horizontal: MobileDimensions.mobile48 / 4,
          // ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius == 0 ? 8 : borderRadius,
              ),
            ),
            borderSide: hasFocusedBorder
                ? BorderSide(
                    color: focusedBorderColor ?? context.color.primary,
                    width: 1.0,
                  )
                : BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius == 0 ? 8 : borderRadius,
              ),
            ),
            borderSide: hasEnabledBorderSide
                ? BorderSide(
                    color: activeColor ??
                        Color(
                          0xFFE0E0E0,
                        ),
                    width: widthBorderSide,
                    // width: 2.0,
                  )
                : BorderSide.none,
            // borderSide: BorderSide(
            //   width: 1.0,
            //   // color: AppColors.purple,
            // ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius == 0 ? 8 : borderRadius,
              ),
            ),
            // borderSide: BorderSide.none,
            borderSide: BorderSide(
              color: context.color.secondarySurfacesInputs,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius == 0 ? 8 : borderRadius,
              ),
            ),
            borderSide: BorderSide(
              color: context.color.secondarySurfacesInputs,
              width: 1.0,
            ),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius == 0 ? 8 : borderRadius,
              ),
            ),
            borderSide: errorBorderSide,
          ),
        ),
      ),
    );
  }
}
