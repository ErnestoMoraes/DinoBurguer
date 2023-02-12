import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class OrderField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String hinText;

  const OrderField({
    super.key,
    required this.title,
    required this.controller,
    required this.validator,
    required this.hinText,
  });

  @override
  Widget build(BuildContext context) {
    const defaulBorder = OutlineInputBorder();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                title,
                style: context.textStyles.textRegular
                    .copyWith(fontSize: 16, overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                hintText: hinText,
                border: defaulBorder,
                enabledBorder: defaulBorder,
                focusedBorder: defaulBorder,
                errorBorder: defaulBorder,
                focusedErrorBorder: defaulBorder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
