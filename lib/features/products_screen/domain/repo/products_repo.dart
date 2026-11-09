import 'package:dartz/dartz.dart';
import 'package:navo/core/error/failures.dart';
import 'package:navo/features/products_screen/data/models/products_response.dart';

abstract class ProductsRepo {
  Future<Either<CommerceFailure, ProductsResponse>> getProducts(id);
}
