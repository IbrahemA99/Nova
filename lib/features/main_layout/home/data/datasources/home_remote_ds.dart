import 'package:navo/core/network/commerce_client.dart';
import 'package:navo/di.dart';
import 'package:navo/features/main_layout/home/data/model/category_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDS {
  Future<CategoryModel> getCategories();
}

@Injectable(as: HomeRemoteDS)
class HomeRemoteDSImpl implements HomeRemoteDS {
  @override
  Future<CategoryModel> getCategories() {
    return getIt<CommerceClient>().getCategories();
  }
}
