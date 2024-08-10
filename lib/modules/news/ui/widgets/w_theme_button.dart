import 'package:flutter/material.dart';
import 'package:news_z/theme/theme_colors.dart';

class ThemeButton extends ElevatedButton {
  ThemeButton({
    this.icon,
    this.text,
    super.onPressed,
    this.color = ThemeColors.primary,
    super.key,
    this.borderRadius,
    this.borderColor,
    this.splashColor,
    this.padding,
    this.elevation,
    this.textWeight,
    this.textSize,
    this.textColor,
  }) : super(
            style: ButtonStyle(
                elevation: WidgetStateProperty.all(elevation ?? 0),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(20),
                    side: BorderSide(
                        color: borderColor ?? color ?? ThemeColors.white),
                  ),
                ),
                overlayColor: WidgetStateProperty.all<Color>(
                    splashColor ?? ThemeColors.white.withOpacity(0.1)),
                backgroundColor:
                    WidgetStateProperty.all<Color>(color ?? ThemeColors.white)),
            child: Padding(
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 5),
              child: FittedBox(
                child: icon,
              ),
            ));

  final String? text;
  final Color? color;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? splashColor;
  final EdgeInsets? padding;
  final double? elevation;
  final FontWeight? textWeight;
  final double? textSize;
  final ThemeColors? textColor;
  final Icon? icon;
}
