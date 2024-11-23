import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_clone/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  final AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;
  bool _isSongLoaded = false; // Track if song URL is loaded

  SongPlayerCubit() : super(SongPlayerLoading()) {
    // Listen to position stream only if the song is loaded
    audioPlayer.positionStream.listen((position) {
      if (_isSongLoaded) {
        songPosition = position;
        updateSongPlayer();
      }
    });

    // Listen to duration stream
    audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        songDuration = duration;
      }
    });
  }

  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      _isSongLoaded = true; // Mark song as loaded
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerFailure());
    }
  }

  void updateSongPlayer() {
    if (!isClosed) {
      emit(SongPlayerLoaded());
    }
  }

  void playOrPauseSong() {
    try {
      if (audioPlayer.playing) {
        audioPlayer.pause();
      } else {
        audioPlayer.play();
      }
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerFailure());
    }
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
