import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/authentication/create_user_request.dart';
import 'package:spotify_clone/data/models/authentication/signin_user_request.dart';

abstract class AuthenticationRepository {


  Future<Either> signup(CreateUserRequest createUserRequest);
  Future<Either> signin(SignInUserRequest signInUserRequest);
}