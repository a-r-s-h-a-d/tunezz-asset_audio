import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_player/widget/backgroundcolor.dart';
import 'package:music_player/widget/iconbutton.dart';
import 'package:music_player/widget/title_artist_build_current.dart';

class NowPlaying extends StatefulWidget {
  NowPlaying({
    super.key,
    //required this.isPlaying,
    required this.song,
    required this.artist,
    //required this.imagePath,
    required this.audioPlayer,
  });
  //late bool isPlaying;
  final String song;
  final String artist;
  //final String imagePath;
  final AssetsAudioPlayer audioPlayer;
  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  //double _currentvalue = 0.3;
  //bool toggle = true;
  bool isRepeat = false;
  bool isShuffle = false;

  // Audio find(List<Audio> source, String fromPath) {
  //   return source.firstWhere((element) {
  //     return element.path == fromPath;
  //   });
  // }

  // void updatetitle() {
  //   setState(() {
  //     widget.audioPlayer.getCurrentAudioTitle;
  //   });
  // }

  void repeat() {
    if (isRepeat == true) {
      widget.audioPlayer.setLoopMode(LoopMode.single);
    } else {
      widget.audioPlayer.setLoopMode(LoopMode.playlist);
    }
    setState(() {
      isRepeat = !isRepeat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          'Now Playing',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: nowplayingColor(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.18),
              Image(
                //image: AssetImage(widget.imagePath),
                image: const AssetImage('asset/images/temp_image.jpg'),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              // TitleArtist(audioPlayer: widget.audioPlayer),
              // ListTile(
              //   leading: IconButton(
              //       icon: toggle
              //           ? const Icon(
              //               Icons.favorite_border,
              //               color: Colors.white,
              //               size: 35,
              //             )
              //           : const Icon(
              //               Icons.favorite,
              //               color: Colors.red,
              //               size: 35,
              //             ),
              //       onPressed: () {
              //         setState(() {
              //           // Here we changing the icon.
              //           toggle = !toggle;
              //         });
              //       }),
              //   title: Center(
              //     child: Text(
              //       widget.audioPlayer.getCurrentAudioTitle,
              //       style: const TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 18,
              //           color: Colors.white),
              //     ),
              //   ),
              //   subtitle: Center(
              //     child: Text(
              //       widget.audioPlayer.getCurrentAudioArtist,
              //       style: const TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 12,
              //       ),
              //     ),
              //   ),
              //   trailing: IconButton(
              //     onPressed: () {
              //       showAddtoplaylistBox(context);
              //     },
              //     icon: const Icon(Icons.add_box_outlined),
              //     iconSize: 35,
              //     color: Colors.white,
              //   ),
              // ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: widget.audioPlayer.builderRealtimePlayingInfos(
                      builder: (context, infos) {
                    Duration currentposition = infos.currentPosition;
                    Duration totalduration = infos.duration;
                    return ProgressBar(
                      timeLabelTextStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                      thumbColor: Colors.white,
                      baseBarColor: Colors.white,
                      progressBarColor: Colors.green,
                      thumbRadius: 7,
                      barHeight: 4,
                      progress: currentposition,
                      total: totalduration,
                      onSeek: (newPosition) {
                        widget.audioPlayer.seek(newPosition);
                      },
                    );
                  })),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      icon: widget.audioPlayer.isShuffling.value
                          ? Icons.shuffle_on_outlined
                          : Icons.shuffle,
                      onPressed: () {
                        setState(() {
                          widget.audioPlayer.toggleShuffle();

                          //isShuffle = !isShuffle;
                        });
                      },
                      size: 35,
                    ),
                    CustomIconButton(
                        size: 35,
                        icon: Icons.skip_previous,
                        onPressed: () {
                          widget.audioPlayer.previous();
                        }),
                    PlayerBuilder.isPlaying(
                        player: widget.audioPlayer,
                        builder: (context, isPlaying) {
                          return GestureDetector(
                            onTap: () async {
                              await widget.audioPlayer.playOrPause();
                            },
                            child: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 30,
                            ),
                          );
                        }),
                    CustomIconButton(
                        size: 35,
                        icon: Icons.skip_next,
                        onPressed: () {
                          widget.audioPlayer.next(
                            keepLoopMode: true,
                            stopIfLast: true,
                          );
                        }),
                    CustomIconButton(
                        size: 35,
                        icon: isRepeat ? Icons.repeat_one : Icons.repeat,
                        onPressed: () {
                          setState(() {
                            repeat();
                            //isRepeat = !isRepeat;
                          });
                          widget.audioPlayer.toggleLoop();
                        }),
                  ],
                ),
              ),
              TitleArtist(audioPlayer: widget.audioPlayer),
            ],
          )),
        ),
      ),
    );
  }
}
