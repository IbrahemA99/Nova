import 'package:dartz/dartz.dart';
import 'package:navo/core/error/failures.dart';
import 'package:navo/features/main_layout/home/data/model/category_model.dart';

abstract class HomeRepo {
  Future<Either<CommerceFailure, CategoryModel>> getCategories();
}
