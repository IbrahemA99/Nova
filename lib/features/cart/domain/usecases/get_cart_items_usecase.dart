import 'package:dartz/dartz.dart';
import 'package:navo/core/error/failures.dart';
import 'package:navo/features/cart/data/models/cart_count_response.dart';
import 'package:navo/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartItemsUseCase {
  CartRepo repo;

  GetCartItemsUseCase(this.repo);

  Future<Either<CommerceFailure, CartCountResponse>> call() =>
      repo.getCartItems();
}
