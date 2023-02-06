// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/models/payment_type_model.dart';

part 'order_state.g.dart';

@match
enum OrderSatus {
  inital,
  loading,
  loaded,
  updateOrder,
  error,
  confirmRemoveProdcut,
  emptyBag,
  success,
}

class OrderState extends Equatable {
  final OrderSatus status;
  final List<OrderProductDto> orderProducts;
  final List<PaymentTypeModel> paymentTypes;
  final String? errorMessage;

  const OrderState({
    required this.status,
    required this.orderProducts,
    required this.paymentTypes,
    this.errorMessage,
  });

  const OrderState.inital()
      : status = OrderSatus.inital,
        orderProducts = const [],
        paymentTypes = const [],
        errorMessage = null;

  double get totalOder => orderProducts.fold(
        0.0,
        (previousValue, element) => previousValue + element.totalPrice,
      );

  @override
  List<Object?> get props => [status, orderProducts, paymentTypes];

  OrderState copyWith({
    OrderSatus? status,
    List<OrderProductDto>? orderProducts,
    List<PaymentTypeModel>? paymentTypes,
    String? errorMessage,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
      paymentTypes: paymentTypes ?? this.paymentTypes,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class OrderConfirmDeleteProductState extends OrderState {
  final OrderProductDto orderProduct;
  final int index;

  const  OrderConfirmDeleteProductState({
    required this.orderProduct,
    required this.index,
    required super.status,
    required super.orderProducts,
    required super.paymentTypes,
    super.errorMessage   
  });
}