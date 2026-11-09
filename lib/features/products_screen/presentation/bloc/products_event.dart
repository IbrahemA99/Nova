part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class GetProductsEvent extends ProductsEvent {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class AddToCartEvent extends ProductsEvent {
  String id;

  AddToCartEvent(this.id);

  @override
  List<Object?> get props => [id];
}
