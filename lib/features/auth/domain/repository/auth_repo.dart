import 'package:dartz/dartz.dart';
import 'package:navo/core/error/failures.dart';
import 'package:navo/features/auth/data/models/auth_response_model.dart';
import 'package:navo/features/auth/data/models/login_request.dart';
import 'package:navo/features/auth/data/models/signup_request.dart';

abstract class AuthRepo {
  Future<Either<CommerceFailure, AuthResponseModel>> login(
    LoginRequest request,
  );
  Future<Either<CommerceFailure, AuthResponseModel>> signUp(
    SignupRequest request,
  );
}
