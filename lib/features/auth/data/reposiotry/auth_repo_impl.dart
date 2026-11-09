import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:navo/core/cache/cache_helper.dart';
import 'package:navo/core/error/failures.dart';
import 'package:navo/features/auth/data/datasources/auth_remote_ds.dart';
import 'package:navo/features/auth/data/models/auth_response_model.dart';
import 'package:navo/features/auth/data/models/login_request.dart';
import 'package:navo/features/auth/data/models/signup_request.dart';
import 'package:navo/features/auth/domain/repository/auth_repo.dart';


@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDS authRemoteDS;

  AuthRepoImpl(this.authRemoteDS);

  @override
  Future<Either<CommerceFailure, AuthResponseModel>> login(
    LoginRequest request,
  ) async {
    try {
      var result = await authRemoteDS.login(request);
      if (result.message != "success") {
        return Left(WrongPasswordFailure(message: result.message));
      }
      CacheHelper.saveString("token", result.token);
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CommerceFailure, AuthResponseModel>> signUp(
    SignupRequest request,
  ) async {
    try {
      var result = await authRemoteDS.signUp(request);
      if (result.message != "success") {
        return Left(WrongPasswordFailure(message: result.message));
      }
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
