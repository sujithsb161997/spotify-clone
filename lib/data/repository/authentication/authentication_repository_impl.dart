import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/authentication/create_user_request.dart';
import 'package:spotify_clone/data/models/authentication/signin_user_request.dart';
import 'package:spotify_clone/data/sources/authentication/authentication_firebase_service.dart';
import 'package:spotify_clone/domain/repository/authentication/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<Either> signin(SignInUserRequest signInUserRequest) async {
    return await sl<AuthenticationFirebaseService>().signin(signInUserRequest);
   
  }

  @override
  Future<Either> signup( CreateUserRequest createUserRequest) async {
    return await sl<AuthenticationFirebaseService>().signup(createUserRequest);
  }

}