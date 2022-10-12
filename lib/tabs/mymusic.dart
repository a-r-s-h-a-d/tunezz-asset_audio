//import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/widget/music_tile.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:permission_handler/permission_handler.dart';

class MyMusic extends StatefulWidget {
  const MyMusic({Key? key}) : super(key: key);

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  // final _audioquery = OnAudioQuery();
  // @override
  // void initState() {
  //   requestPermission();
  //   super.initState();
  // }

  // void requestPermission() {
  //   Permission.storage.request();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Listing Dummy Contents for Playing Audio from Asset Folder
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    MusicListTile(
                      audioPlayer: audioPlayer,
                      //imagePath: 'asset/images/blinding lights.png',
                      song: 'Blinding Lights',
                      artist: 'Duncan Lawrence',
                      index: 0,
                    ),
                    MusicListTile(
                      audioPlayer: audioPlayer,
                      //imagePath: 'asset/images/Heat Waves.png',
                      song: 'Heat Waves',
                      artist: 'Glass Animals',
                      index: 1,
                    ),
                    MusicListTile(
                      audioPlayer: audioPlayer,
                      //imagePath: 'asset/images/Sunflower.jpeg',
                      song: 'Sunflower',
                      artist: 'Post Malone,Swalee',
                      index: 2,
                    ),
                    MusicListTile(
                      audioPlayer: audioPlayer,
                      //imagePath: 'asset/images/Sunflower.jpeg',
                      song: 'Adheera',
                      artist: 'A.R.Rahman',
                      index: 3,
                    ),
                    MusicListTile(
                      audioPlayer: audioPlayer,
                      //imagePath: 'asset/images/Sunflower.jpeg',
                      song: 'Khwaab',
                      artist: 'Anumita Nadeshan',
                      index: 4,
                    ),
                    MusicListTile(
                      audioPlayer: audioPlayer,
                      //imagePath: 'asset/images/Sunflower.jpeg',
                      song: 'Kun Faya Kun',
                      artist: 'A.R.Rahman',
                      index: 5,
                    ),
                    MusicListTile(
                      audioPlayer: audioPlayer,
                      //imagePath: 'asset/images/Sunflower.jpeg',
                      song: 'Mahi ve',
                      artist: 'A.R.Rahman',
                      index: 6,
                    ),
                    MusicListTile(
                      audioPlayer: audioPlayer,
                      //imagePath: 'asset/images/Sunflower.jpeg',
                      song: 'NCA',
                      artist: 'Andro',
                      index: 7,
                    ),
                    MusicListTile(
                      audioPlayer: audioPlayer,
                      //imagePath: 'asset/images/Sunflower.jpeg',
                      song: 'Old Town Road',
                      artist: 'Lil Nas x',
                      index: 8,
                    ),
                    MusicListTile(
                      audioPlayer: audioPlayer,
                      //imagePath: 'asset/images/Sunflower.jpeg',
                      song: 'Vikram Squad',
                      artist: 'Anirudh Ravichander',
                      index: 9,
                    ),

                    // ---->edit later<----
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemBuilder: (context, index) {
                    //       return MusicListTile(
                    //         //imagePath: 'item.data![index].',
                    //         song: audios.data![index].displayNameWOExt
                    //         artist: 'item.data![index].artist.toString()',
                    //         index: index,
                    //         audioPlayer: audioPlayer,
                    //       );
                    //     },
                    //     itemCount: 3,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),

          //Fetching From Phone

          // Expanded(
          //   child: FutureBuilder<List<SongModel>>(
          //     future: _audioquery.querySongs(
          //       sortType: null,
          //       orderType: OrderType.ASC_OR_SMALLER,
          //       uriType: UriType.EXTERNAL,
          //       ignoreCase: true,
          //     ),
          //     builder: (context, item) {
          //       if (item.data == null) {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }
          //       if (item.data!.isEmpty) {
          //         return Center(
          //           child: AnimatedTextKit(
          //             animatedTexts: [
          //               ScaleAnimatedText(
          //                 'No Songs Found',
          //                 textStyle: const TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 20),
          //               ),
          //             ],
          //             repeatForever: true,
          //           ),
          //         );
          //       }
          //       return ListView.builder(
          //         itemBuilder: (context, index) => MusicListTile(
          //           audioPlayer: audioPlayer,
          //           index: index,
          //           // imagePath: 'asset/images/Sunflower.jpeg',
          //           song: item.data![index].displayNameWOExt,
          //           artist: item.data![index].artist.toString(),
          //           audioPath: item.data![index].uri!,
          //         ),
          //         itemCount: item.data!.length,
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
