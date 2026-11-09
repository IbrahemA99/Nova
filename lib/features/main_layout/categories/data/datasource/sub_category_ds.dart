import 'package:navo/core/network/commerce_client.dart';
import 'package:navo/di.dart';
import 'package:navo/features/main_layout/categories/data/models/sub_category_response.dart';
import 'package:injectable/injectable.dart';

abstract class SubCategoryDS {
  Future<SubCategoryResponse> getSubCategory(String id);
}

@Injectable(as: SubCategoryDS)
class SubCategoryDSImpl implements SubCategoryDS {
  @override
  Future<SubCategoryResponse> getSubCategory(String id) {
    return getIt<CommerceClient>().getSubCategories(id);
  }
}
