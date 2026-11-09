part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddToCartEvent extends CartEvent {
 final String id;

  AddToCartEvent(this.id);
}

class GetCartItemsEvent extends CartEvent {
  GetCartItemsEvent();
}
