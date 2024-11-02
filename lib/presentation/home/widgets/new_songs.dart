import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/home/bloc/new_songs_cubit.dart';
import 'package:spotify_clone/presentation/home/bloc/new_songs_state.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewSongsCubit()..getNewSongs(),
      child: SizedBox(
        child: BlocBuilder<NewSongsCubit, NewSongsState>(
            builder: (context, state) {
          if (state is NewSongsLoading) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }

          if (state is NewSongsLoaded) {
            return _songs(state.songs);
          }
          if (state is NewSongsLoadFailure) {
            return Text("Failed to load new songs");
          }

          return const SizedBox();
        }),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(songs[index].imageUrl))),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      transform: Matrix4.translationValues(10, 10, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode ?  AppColors.darkGrey : const Color(0xffE6E6E6)
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: context.isDarkMode ? const Color(0xff959595) : const Color(0xff555555),
                      ),
                    ),
                  ),),
                const SizedBox(
                  height: 10,
                ),
                Text(songs[index].title, style: const TextStyle(
                  fontWeight: FontWeight.w600,fontSize: 16
                ),),
                const SizedBox(
                  height: 5,
                ),
                Text(songs[index].artist, style: const TextStyle(
                  fontWeight: FontWeight.w400,fontSize: 12
                ),),
              ],
            ),
          );
        },
        separatorBuilder: (contex, index) {
          return const SizedBox(
            width: 14,
          );
        },
        itemCount: songs.length);
  }
}
