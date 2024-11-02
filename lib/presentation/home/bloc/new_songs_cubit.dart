import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_clone/presentation/home/bloc/new_songs_state.dart';
import 'package:spotify_clone/service_locator.dart';

class NewSongsCubit extends Cubit<NewSongsState> {
  NewSongsCubit() : super(NewSongsLoading());

  Future<void> getNewSongs() async {
    try {
    var returnedSongs = await sl<GetNewSongsUseCase>().call();
    returnedSongs.fold(
      (l) {
        emit(NewSongsLoadFailure());
      },
      (r) {
        emit(NewSongsLoaded(songs: r));
      },
    );
      
    } catch (e) {
      print(e);
      
    }
   
  }
}
