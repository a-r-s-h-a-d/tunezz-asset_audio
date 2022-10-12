import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

class MiniplayerTile extends StatefulWidget {
  const MiniplayerTile({
    super.key,
    required this.audioPlayer,
  });
  final AssetsAudioPlayer audioPlayer;
  @override
  State<MiniplayerTile> createState() => _MiniplayerTileState();
}

class _MiniplayerTileState extends State<MiniplayerTile> {
  //bool isPlaying = true;
  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) {
      return element.path == fromPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.audioPlayer.builderCurrent(
      builder: (context, playing) {
        return ListTile(
          leading: CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.07,
            backgroundImage: const AssetImage('asset/images/temp_image.jpg'),
          ),
          title: Marquee(
            pauseDuration: const Duration(milliseconds: 100),
            direction: Axis.horizontal,
            textDirection: TextDirection.ltr,
            autoRepeat: true,
            child: Text(
              widget.audioPlayer.getCurrentAudioTitle,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //previous
              IconButton(
                onPressed: () async {
                  await widget.audioPlayer.previous();
                },
                icon: const Icon(Icons.skip_previous),
                color: Colors.white,
              ),
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
              //next
              IconButton(
                onPressed: () async {
                  await widget.audioPlayer.next(stopIfLast: true);
                },
                icon: const Icon(Icons.skip_next),
                color: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
