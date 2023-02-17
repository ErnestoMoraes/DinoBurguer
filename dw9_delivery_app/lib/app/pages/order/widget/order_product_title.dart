import 'package:dw9_delivery_app/app/core/extensions/formatter_extension.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/pages/order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:provider/provider.dart';

class OrderProductTitle extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProductTitle({
    super.key,
    required this.index,
    required this.orderProduct,
  });

  @override
  Widget build(BuildContext context) {
    final product = orderProduct.product;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: FadeInImage.assetNetwork(
                placeholder: cupertinoActivityIndicator,
                image: product.image,
                height: 100,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style:
                        context.textStyles.textExtraBold.copyWith(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.price.currencyPTBR,
                        style: context.textStyles.textRegular.copyWith(
                          fontSize: 14,
                          color: context.colors.primary,
                        ),
                      ),
                      DeliveryIncrementDecrementButton.compact(
                        amount: orderProduct.amount,
                        incrementTap: () {
                          context
                              .read<OrderController>()
                              .incrementProduct(index);
                        },
                        decrementTap: () {
                          context
                              .read<OrderController>()
                              .decrementProduct(index);
                        },
                      )
                    ],
                  ),
                  Text(
                    (orderProduct.amount * product.price).currencyPTBR,
                    style: context.textStyles.textSemiBold.copyWith(
                      fontSize: 20,
                      color: context.colors.secondary,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
