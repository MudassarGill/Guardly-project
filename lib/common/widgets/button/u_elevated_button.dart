import 'package:flutter/material.dart';
import 'package:mindshield/Utilities/constants/colors.dart';

enum UButtonType { circle, rectangle, text }

class UElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;

  // Content
  final String? text;
  final IconData? icon;

  // Style
  final Color? backgroundColor;
  final Color? bPrimaryColor1;
  final Color? bPrimaryColor2;
  final Color? iconColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final double elevation;

  // Button type
  final UButtonType buttonType;

  // Visibility
  final bool isVisible;

  const UElevatedButton({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.backgroundColor,
    this.bPrimaryColor1,
    this.bPrimaryColor2,
    this.iconColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius = 12,
    this.elevation = 0,
    this.buttonType = UButtonType.rectangle,
    this.isVisible = true,
  });

  // ─── Factory Constructors ───────────────────────────────────────────────────

  /// 🔵 Circle Button
  const UElevatedButton.circle({
    super.key,
    required this.onPressed,
    this.icon,
    this.text,
    this.bPrimaryColor1,
    this.bPrimaryColor2,
    this.iconColor,
    this.textColor,
    this.width = 56,
    this.height = 56,
    this.elevation = 0,
    this.isVisible = true,
  })  : buttonType = UButtonType.circle,
        backgroundColor = null,
        borderRadius = 0;

  /// 🟩 Rectangle Button
  const UElevatedButton.rectangle({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.backgroundColor,
    this.bPrimaryColor1,
    this.bPrimaryColor2,
    this.textColor,
    this.iconColor,
    this.width = double.infinity,
    this.height = 56,
    this.borderRadius = 12,
    this.elevation = 0,
    this.isVisible = true,
  })  : buttonType = UButtonType.rectangle;

  /// 🔤 Text Button
  const UElevatedButton.textButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.icon,
    this.iconColor,
    this.isVisible = true,
  })  : buttonType = UButtonType.text,
        backgroundColor = null,
        bPrimaryColor1 = null,
        bPrimaryColor2 = null,
        width = null,
        height = null,
        borderRadius = 0,
        elevation = 0;

  // ─── Content Builder ────────────────────────────────────────────────────────

  Widget _buildContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, color: iconColor ?? Colors.white, size: 22),
          if (text != null) const SizedBox(width: 8),
        ],
        if (text != null)
          Text(
            text!,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
      ],
    );
  }

  // ─── Variant Builders ───────────────────────────────────────────────────────

  /// 🔵 Circle
  Widget _buildCircle() {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bPrimaryColor1,
          border: Border(
            bottom: BorderSide(
              color: bPrimaryColor2 ?? Colors.transparent,
              width: 3,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00796B).withValues(alpha: 0.3),
              offset: const Offset(0, 0.5),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: elevation,
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
          ),
          child: _buildContent(),
        ),
      ),
    );
  }

  /// 🟩 Rectangle
  Widget _buildRectangle() {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: UColors.green_800, width: 2),
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? bPrimaryColor1,
            elevation: elevation,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: _buildContent(),
        ),
      ),
    );
  }

  /// 🔤 Text
  Widget _buildTextButton() {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor ?? UColors.green_800,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // if (icon != null) ...[
          //   Icon(icon, color: iconColor ?? UColors.green_800, size: 18),
          //   const SizedBox(width: 6),
          // ],
          if (text != null)
            Text(
              text!,
              style: TextStyle(
                color: textColor ?? UColors.green_800,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
        ],
      ),
    );
  }

  // ─── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    switch (buttonType) {
      case UButtonType.circle:
        return _buildCircle();
      case UButtonType.rectangle:
        return _buildRectangle();
      case UButtonType.text:
        return _buildTextButton();
    }
  }
}