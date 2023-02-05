// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';

part 'order_state.g.dart';

@match
enum OrderSatus {
  inital,
  loaded,
}

class OrderState extends Equatable {
  final OrderSatus status;
  final List<OrderProductDto> orderProducts;

  const OrderState({
    required this.status,
    required this.orderProducts,
  });

  const OrderState.inital()
      : status = OrderSatus.inital,
        orderProducts = const [];

  @override
  List<Object?> get props => [status, orderProducts];

  OrderState copyWith({
    OrderSatus? status,
    List<OrderProductDto>? orderProducts,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
    );
  }
}
