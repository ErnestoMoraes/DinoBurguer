import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  const DeliveryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        child: Text(
          label,
          style: context.textStyles.textExtraBold.copyWith(
              fontSize: 18, color: const Color.fromRGBO(68, 31, 75, 1)),
        ),
      ),
    );
  }
}
