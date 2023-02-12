// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';

class OrderField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String hinText;
  final List<TextInputFormatter>? inputFormatters;

  const  OrderField({
    Key? key,
    required this.title,
    required this.controller,
    required this.validator,
    required this.hinText,
    this.inputFormatters,
  }) : super(key: key);

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
              inputFormatters: inputFormatters,
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
