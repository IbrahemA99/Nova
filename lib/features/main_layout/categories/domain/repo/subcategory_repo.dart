import 'package:dartz/dartz.dart';
import 'package:navo/core/error/failures.dart';
import 'package:navo/features/main_layout/categories/data/models/sub_category_response.dart';

abstract class SubCategoryRepo {
  Future<Either<CommerceFailure, SubCategoryResponse>> getSubCategories(
    String id,
  );
}
