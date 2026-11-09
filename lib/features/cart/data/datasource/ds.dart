import 'package:navo/core/network/commerce_client.dart';
import 'package:navo/di.dart';
import 'package:navo/features/cart/data/models/add_to_cart_request.dart';
import 'package:navo/features/cart/data/models/cart_count_response.dart';
import 'package:navo/features/cart/data/models/cart_response.dart';
import 'package:injectable/injectable.dart';

abstract class CartDS {
  Future<CartResponse> addToCart(AddToCartRequest request, String token);

  Future<CartCountResponse> getCartItems(String token);
}

@Injectable(as: CartDS)
class CartDSImpl implements CartDS {
  @override
  Future<CartResponse> addToCart(AddToCartRequest request, String token) async {
    return getIt<CommerceClient>().addToCart(request, token);
  }

  @override
  Future<CartCountResponse> getCartItems(String token) {
    return getIt<CommerceClient>().getCartItems(token);
  }
}
