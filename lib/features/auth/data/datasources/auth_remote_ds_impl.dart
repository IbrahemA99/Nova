import 'package:injectable/injectable.dart';
import 'package:navo/core/network/commerce_client.dart';
import 'package:navo/di.dart';
import 'package:navo/features/auth/data/models/auth_response_model.dart';
import 'package:navo/features/auth/data/models/login_request.dart';
import 'package:navo/features/auth/data/models/signup_request.dart';


import 'auth_remote_ds.dart';

@Injectable(as: AuthRemoteDS)
class AuthRemoteDSImpl implements AuthRemoteDS {
  @override
  Future<AuthResponseModel> login(LoginRequest request) {
    return getIt<CommerceClient>().login(request);
  }

  @override
  Future<AuthResponseModel> signUp(SignupRequest request) {
    return getIt<CommerceClient>().signUp(request);
  }
}
