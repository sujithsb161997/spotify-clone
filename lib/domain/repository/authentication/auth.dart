import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/authentication/create_user_request.dart';

abstract class AuthenticationRepository {


  Future<Either> signup(CreateUserRequest createUserRequest);
  Future<void> signin();
}