import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/functions/dialogbiox.dart';
import 'package:music_player/screens/screen_nowplaying.dart';
import 'package:music_player/widget/miniplayer.dart';

class MusicListTile extends StatefulWidget {
  const MusicListTile(
      {
      // required this.imagePath,
      required this.song,
      required this.artist,
      required this.index,
      //required this.audioPath,
      super.key,
      required this.audioPlayer});
  // final String imagePath;
  final String song;
  final String artist;
  final int index;
  final AssetsAudioPlayer audioPlayer;
  //final String audioPath;

  @override
  State<MusicListTile> createState() => _MusicListTileState();
}

class _MusicListTileState extends State<MusicListTile> {
  //bool isPlaying = true;
//<-----open songs in Asset Folder----->

  @override
  void dispose() {
    widget.audioPlayer.dispose();
    super.dispose();
  }

  //<-----open song from device----->
  // @override
  // void initState() {
  //   openSongs();
  //   super.initState();
  // }

  // void openSongs() async {
  //   await widget.audioPlayer.open(
  //     Audio.file(widget.audioPath),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: const AssetImage('asset/images/temp_image.jpg'),
        radius: MediaQuery.of(context).size.width * 0.07,
      ),
      title: Text(
        widget.song,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      subtitle: Text(
        widget.artist,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
      trailing: PopupMenuButton(
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        color: Colors.grey,
        itemBuilder: (context) => [
          PopupMenuItem(
            child: InkWell(
              onTap: (() {
                var snackdemo = SnackBar(
                  content: Text('${widget.song} added to favorites'),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 1),
                  elevation: 10,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackdemo);
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Add to Favorites',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            child: InkWell(
              onTap: () => showAddtoplaylistBox(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Add to Playlist',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Icon(
                    Icons.playlist_add,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        widget.audioPlayer.play();

        showBottomSheet(
          enableDrag: false,
          context: context,
          builder: (context) {
            widget.audioPlayer.open(
              Playlist(
                audios: [
                  Audio(
                    'asset/audios/Blinding_Lights.mp3',
                    metas: Metas(
                      title: "Blinding Lights",
                      artist: "Duncan Lawrence",
                    ),
                  ),
                  Audio(
                    'asset/audios/Heat_Waves.mp3',
                    metas: Metas(
                      title: "Heat Waves",
                      artist: "Glass Animals",
                    ),
                  ),
                  Audio(
                    'asset/audios/Sunflower_-_Spider-Man__Into_the_Spider-Verse.mp3',
                    metas: Metas(
                      title: "Sunflower",
                      artist: "Post Malone,Swalee",
                    ),
                  ),
                  Audio(
                    'asset/audios/Adheeraa__From__Cobra__.mp3',
                    metas: Metas(
                      title: "Adheera",
                      artist: "A.R.Rahman",
                    ),
                  ),
                  Audio(
                    'asset/audios/Khwaab.mp3',
                    metas: Metas(
                      title: "Khwaab",
                      artist: "Anumita Nadeshan",
                    ),
                  ),
                  Audio(
                    'asset/audios/Kun_Faya_Kun.mp3',
                    metas: Metas(
                      title: "Kun Faya Kun",
                      artist: "A.R.Rahman",
                    ),
                  ),
                  Audio(
                    'asset/audios/Maahi_Ve.mp3',
                    metas: Metas(
                      title: "Mahi ve",
                      artist: "A.R.Rahman",
                    ),
                  ),
                  Audio(
                    'asset/audios/NCA.mp3',
                    metas: Metas(
                      title: "NCA",
                      artist: "Andro",
                    ),
                  ),
                  Audio(
                    'asset/audios/Old_Town_Road.mp3',
                    metas: Metas(
                      title: "Old Town Road",
                      artist: "Lil Nas x",
                    ),
                  ),
                  Audio(
                    'asset/audios/The_Vikram_Squad_-_Background_Score.mp3',
                    metas: Metas(
                      title: "Vikram Squad",
                      artist: "Anirudh Ravichander",
                    ),
                  ),
                ],
                startIndex: widget.index,
              ),
              autoStart: true,
              showNotification: true,
              //loopMode: LoopMode.playlist,
            );
            return Container(
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => NowPlaying(
                              song: widget.song,
                              artist: widget.artist,
                              //isPlaying: isPlaying,
                              // imagePath: widget.imagePath,
                              audioPlayer: widget.audioPlayer,
                            )),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MiniplayerTile(audioPlayer: widget.audioPlayer),
                    ],
                  )),
            );
          },
        );
      },
    );
  }
}
