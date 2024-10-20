import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/authentication/authentication_repository_impl.dart';
import 'package:spotify_clone/data/sources/authentication/authentication_firebase_service.dart';
import 'package:spotify_clone/domain/repository/authentication/auth.dart';
import 'package:spotify_clone/domain/usecases/authentication/signin_usecase.dart';
import 'package:spotify_clone/domain/usecases/authentication/signup_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<AuthenticationFirebaseService>(
    AuthenticationFirebaseServiceImpl()
  );
  sl.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl()
  );
  sl.registerSingleton<SignupUsecase>(
    SignupUsecase()
  );
  sl.registerSingleton<SignInUsecase>(
    SignInUsecase()
  );
}