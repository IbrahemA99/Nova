import 'package:dartz/dartz.dart';
import 'package:navo/core/error/failures.dart';
import 'package:navo/features/products_screen/data/models/products_response.dart';
import 'package:navo/features/products_screen/domain/repo/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  ProductsRepo repo;

  GetProductsUseCase(this.repo);

  Future<Either<CommerceFailure, ProductsResponse>> call(String id) =>
      repo.getProducts(id);
}
