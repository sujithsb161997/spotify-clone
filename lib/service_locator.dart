import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/authentication/authentication_repository_impl.dart';
import 'package:spotify_clone/data/repository/song/song_repository.dart';
import 'package:spotify_clone/data/sources/authentication/authentication_firebase_service.dart';
import 'package:spotify_clone/data/sources/songs/song_firebase_service.dart';
import 'package:spotify_clone/domain/repository/authentication/auth.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/domain/usecases/authentication/signin_usecase.dart';
import 'package:spotify_clone/domain/usecases/authentication/signup_usecase.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_clone/domain/usecases/song/get_playlist.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<AuthenticationFirebaseService>(
    AuthenticationFirebaseServiceImpl()
  );
  sl.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl()
  );
    sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl()
  );
  sl.registerSingleton<SongsRepository>(
    SongRepositoryImpl()
  );
 
  sl.registerSingleton<SignupUsecase>(
    SignupUsecase()
  );
  sl.registerSingleton<SignInUsecase>(
    SignInUsecase()
  );

   sl.registerSingleton<GetNewSongsUseCase>(
    GetNewSongsUseCase()
  );
   sl.registerSingleton<GetPlaylistUseCase>(
    GetPlaylistUseCase()
  );
 
}