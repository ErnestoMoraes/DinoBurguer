import 'dart:developer';

import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/pages/order/order_state.dart';
import 'package:dw9_delivery_app/app/repositories/order/order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;
  OrderController(this._orderRepository) : super(const OrderState.inital());

  void load(List<OrderProductDto> products) async {
    try {
      emit(state.copyWith(status: OrderSatus.loading));
      final paymentTypes = await _orderRepository.getAllPaymentsTypes();
      emit(
        state.copyWith(
          orderProducts: products,
          status: OrderSatus.loaded,
          paymentTypes: paymentTypes,
        ),
      );
    } catch (e, s) {
      log('Erro ao carregar pagina / Order Controller',
          error: e, stackTrace: s);
      emit(state.copyWith(
          status: OrderSatus.error, errorMessage: 'Erro ao carregar pagina'));
    }
  }

  void incrementProduct(int index) {
    final orders = [...state.orderProducts];
    final order = orders[index];
    orders[index] = order.copyWith(amount: order.amount + 1);
    emit(state.copyWith(orderProducts: orders, status: OrderSatus.updateOrder));
  }

  void decrementProduct(int index) {
    final orders = [...state.orderProducts];
    final order = orders[index];
    final amount = order.amount;

    if (amount == 1) {
      if (state.status != OrderSatus.confirmRemoveProdcut) {
        emit(OrderConfirmDeleteProductState(
          orderProduct: order,
          index: index,
          status: OrderSatus.confirmRemoveProdcut,
          orderProducts: state.orderProducts,
          paymentTypes: state.paymentTypes,
          errorMessage: state.errorMessage,
        ));
        return;
      } else {
        orders.removeAt(index);
      }
    } else {
      orders[index] = order.copyWith(amount: order.amount - 1);
    }

    if(orders.isEmpty) {
      emit(state.copyWith(status: OrderSatus.emptyBag));
      return;
    }

    emit(state.copyWith(orderProducts: orders, status: OrderSatus.updateOrder));
  }

  void cancelDeleteProcess() {
    emit(state.copyWith(status: OrderSatus.loaded));
  }

  clearBag() {
    emit(state.copyWith(status: OrderSatus.emptyBag));
  }
}
