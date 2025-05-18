import "package:flutter/material.dart";
import "../../theme_page/constants.dart";

enum ButtonType { primary, secondary, tertiary, disable, state }

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final double borderRadius;
  final EdgeInsets padding;
  final Text text;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.borderRadius = 30.0,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    this.text = const Text(''),
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    BorderSide? border;

    switch (type) {
      case ButtonType.primary:
        bgColor = AppColors.primary;
        textColor = AppColors.secondary;
        break;
      case ButtonType.secondary:
        bgColor = AppColors.background;
        textColor = AppColors.secondary;
        border = const BorderSide(color: AppColors.primary, width: 1.5);
        break;
      case ButtonType.tertiary:
        bgColor = Colors.transparent;
        textColor = AppColors.secondary;
        break;
      case ButtonType.disable:
        bgColor = AppColors.textSecondary;
        textColor = AppColors.secondary;
        break;
      case ButtonType.state:
        bgColor = AppColors.secondary;
        textColor = AppColors.primary;
        break;
    }

    return Opacity(
      opacity: type == ButtonType.disable ? 0.6 : 1.0,
      child: ElevatedButton(
        onPressed: type == ButtonType.disable ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: border ?? BorderSide.none,
          ),
          elevation: 0,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        child: Text(label),
      ),
    );
  }
}
