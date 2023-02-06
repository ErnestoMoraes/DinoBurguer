// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension OrderSatusMatch on OrderSatus {
  T match<T>(
      {required T Function() inital,
      required T Function() loading,
      required T Function() loaded,
      required T Function() updateOrder,
      required T Function() error}) {
    final v = this;
    if (v == OrderSatus.inital) {
      return inital();
    }

    if (v == OrderSatus.loading) {
      return loading();
    }

    if (v == OrderSatus.loaded) {
      return loaded();
    }

    if (v == OrderSatus.updateOrder) {
      return updateOrder();
    }

    if (v == OrderSatus.error) {
      return error();
    }

    throw Exception('OrderSatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? inital,
      T Function()? loading,
      T Function()? loaded,
      T Function()? updateOrder,
      T Function()? error}) {
    final v = this;
    if (v == OrderSatus.inital && inital != null) {
      return inital();
    }

    if (v == OrderSatus.loading && loading != null) {
      return loading();
    }

    if (v == OrderSatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == OrderSatus.updateOrder && updateOrder != null) {
      return updateOrder();
    }

    if (v == OrderSatus.error && error != null) {
      return error();
    }

    return any();
  }
}
