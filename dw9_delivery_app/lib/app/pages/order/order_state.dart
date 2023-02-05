import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

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
}
