import 'package:navo/core/network/commerce_client.dart';
import 'package:navo/di.dart';
import 'package:navo/features/products_screen/data/models/products_response.dart';
import 'package:injectable/injectable.dart';


abstract class ProdDs {
  Future<ProductsResponse> getProducts();
}

@Injectable(as: ProdDs)
class ProdDSImpl implements ProdDs {
  @override
  Future<ProductsResponse> getProducts() {
    return getIt<CommerceClient>().getProducts();
  }
}