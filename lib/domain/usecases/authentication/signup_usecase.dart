import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usercase.dart';
import 'package:spotify_clone/data/models/authentication/create_user_request.dart';
import 'package:spotify_clone/domain/repository/authentication/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SignupUsecase implements UseCase<Either, CreateUserRequest> {
  @override
  Future<Either> call({CreateUserRequest ? params}) {
    return sl<AuthenticationRepository>().signup(params!);
  }


}