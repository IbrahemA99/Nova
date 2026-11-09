import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:navo/features/auth/data/models/auth_response_model.dart';
import 'package:navo/features/auth/data/models/login_request.dart';
import 'package:navo/features/auth/data/models/signup_request.dart';
import 'package:navo/features/cart/data/models/add_to_cart_request.dart';
import 'package:navo/features/cart/data/models/cart_count_response.dart';
import 'package:navo/features/cart/data/models/cart_response.dart';
import 'package:navo/features/main_layout/categories/data/models/sub_category_response.dart';
import 'package:navo/features/main_layout/home/data/model/category_model.dart';
import 'package:navo/features/products_screen/data/models/products_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'commerce_client.g.dart';



@RestApi(baseUrl: 'https://ecommerce.routemisr.com/api/v1/')
abstract class CommerceClient {
  factory CommerceClient(Dio dio, {String? baseUrl}) = _CommerceClient;

  @POST('auth/signin')
  Future<AuthResponseModel> login(@Body() LoginRequest request);
  
  @POST('auth/signup')
  Future<AuthResponseModel> signUp(@Body() SignupRequest request);

  @GET('categories')
  Future<CategoryModel> getCategories();

  @GET("categories/{id}/subcategories")
  Future<SubCategoryResponse> getSubCategories(@Path('id') String categoryId);

  @GET("products")
  Future<ProductsResponse> getProducts();

  @POST("cart")
  Future<CartResponse> addToCart(
    @Body() AddToCartRequest request,
    @Header('token') String token,
  );

  @GET("cart")
  Future<CartCountResponse> getCartItems(@Header('token') String token);
}

@module
abstract class DioModule {
  Dio get dio => Dio()
    ..interceptors.add(PrettyDioLogger(requestBody: true, responseBody: true));

  @lazySingleton
  CommerceClient get commerceClient =>
      CommerceClient(dio, baseUrl:
       'https://ecommerce.routemisr.com/api/v1/');
}
