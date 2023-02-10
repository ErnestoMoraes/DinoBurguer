import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 31, 75, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: context.percentHeight(0.15),
              ),
              Image.asset(
                'assets/images/dino_pagamento_realisado.png',
                height: context.percentHeight(0.35),
              ),
              SizedBox(
                height: context.percentHeight(0.03),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Saudações Dino-gastronômicas!',
                  textAlign: TextAlign.center,
                  style: context.textStyles.textExtraBold.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: context.percentHeight(0.03),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Gostaria de lhe informar que o seu pedido jurássico foi finalizado com sucesso.',
                  textAlign: TextAlign.center,
                  style: context.textStyles.textBold.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: context.percentHeight(0.05),
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
