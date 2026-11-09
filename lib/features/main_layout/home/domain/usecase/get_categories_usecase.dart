import 'package:dartz/dartz.dart';
import 'package:navo/core/error/failures.dart';
import 'package:navo/features/main_layout/home/data/model/category_model.dart';
import 'package:navo/features/main_layout/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  HomeRepo repo;

  GetCategoriesUseCase(this.repo);

  Future<Either<CommerceFailure, CategoryModel>> call() => repo.getCategories();
}
