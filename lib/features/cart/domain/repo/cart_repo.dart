import 'package:dartz/dartz.dart';
import 'package:navo/core/error/failures.dart';
import 'package:navo/features/cart/data/models/add_to_cart_request.dart';
import 'package:navo/features/cart/data/models/cart_count_response.dart';
import 'package:navo/features/cart/domain/entity/cart_entity.dart';

abstract class CartRepo {
  Future<Either<CommerceFailure, CartEntity>> addToCart(
    AddToCartRequest request,
  );
  Future<Either<CommerceFailure, CartCountResponse>> getCartItems();
}
