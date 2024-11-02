import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usercase.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/service_locator.dart';

class GetPlaylistUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getPlaylist();
  }


}