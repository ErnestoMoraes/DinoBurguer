// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension OrderSatusMatch on OrderSatus {
  T match<T>({required T Function() inital, required T Function() loaded}) {
    final v = this;
    if (v == OrderSatus.inital) {
      return inital();
    }

    if (v == OrderSatus.loaded) {
      return loaded();
    }

    throw Exception('OrderSatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any, T Function()? inital, T Function()? loaded}) {
    final v = this;
    if (v == OrderSatus.inital && inital != null) {
      return inital();
    }

    if (v == OrderSatus.loaded && loaded != null) {
      return loaded();
    }

    return any();
  }
}
