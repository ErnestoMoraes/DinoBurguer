import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? cor;
  final Color? textColor;

  const DeliveryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height = 50,
    this.cor = Colors.white,
    this.textColor = const Color.fromRGBO(68, 31, 75, 1),
  });

  const DeliveryButton.initial({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.height,
  })  : cor = const Color.fromRGBO(68, 31, 75, 1),
        textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(cor!),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        child: Text(
          label,
          style: context.textStyles.textExtraBold.copyWith(
              fontSize: 18, color: textColor),
        ),
      ),
    );
  }
}
