import 'package:dartz/dartz.dart';
import 'package:navo/core/error/failures.dart';
import 'package:navo/features/main_layout/categories/data/models/sub_category_response.dart';
import 'package:navo/features/main_layout/categories/domain/repo/subcategory_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoryUseCase {
  SubCategoryRepo repo;

  GetSubCategoryUseCase(this.repo);

  Future<Either<CommerceFailure, SubCategoryResponse>> call(String id) =>
      repo.getSubCategories(id);
}
