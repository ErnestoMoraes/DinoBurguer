// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:dw9_delivery_app/app/models/product_model.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final List<ProductModel> products;

  const HomeState({
    required this.status,
    required this.products,
  });

  const HomeState.initial()
      : status = HomeStatus.initial,
        products = const [];

  @override
  List<Object?> get props => [status, products];

  HomeState copyWith({
    HomeStatus? status,
    List<ProductModel>? products,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
