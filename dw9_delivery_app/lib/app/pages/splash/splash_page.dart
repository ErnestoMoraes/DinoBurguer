import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color.fromRGBO(68, 31, 75, 1),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.35),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: context.percentHeight(0.01)),
                    child: Image.asset('assets/images/logo_dino_2.png'),
                  ),
                  SizedBox(
                    height: context.percentHeight(0.1),
                  ),
                  DeliveryButton(
                    width: context.percentHeight(0.4),
                    label: 'ACESSAR',
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/home');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
