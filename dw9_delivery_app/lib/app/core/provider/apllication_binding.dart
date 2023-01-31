import 'package:dw9_delivery_app/app/core/rest_cliente/custom_dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApllicationBinding extends StatelessWidget {
  final Widget child;
  const ApllicationBinding({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      // Providers
      Provider(create: (context) => CustomDio()),
      
    ], child: child);
  }
}
