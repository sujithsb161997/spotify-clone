import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usercase.dart';
import 'package:spotify_clone/data/models/authentication/signin_user_request.dart';
import 'package:spotify_clone/domain/repository/authentication/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SignInUsecase implements UseCase<Either, SignInUserRequest> {
  @override
  Future<Either> call({SignInUserRequest ? params}) {
    return sl<AuthenticationRepository>().signin(params!);
  }


}