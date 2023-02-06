import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: context.percentHeight(0.2),
              ),
              Image.asset(
                'assets/images/logo_rounded.png',
              ),
              SizedBox(
                height: context.percentHeight(0.03),
              ),
              Text(
                'Pedido realizado com sucesso, em breve você receberá a confirmação do seu pedido!',
                textAlign: TextAlign.center,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: context.percentHeight(0.08),
              ),
              DeliveryButton(
                width: context.percentWidth(0.8),
                label: 'Fechar',
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
