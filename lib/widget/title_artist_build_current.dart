import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/functions/dialogbiox.dart';

class TitleArtist extends StatefulWidget {
  const TitleArtist({
    super.key,
    required this.audioPlayer,
  });
  final AssetsAudioPlayer audioPlayer;
  @override
  State<TitleArtist> createState() => _TitleArtistState();
}

class _TitleArtistState extends State<TitleArtist> {
  bool toggle = true;
  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) {
      return element.path == fromPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.audioPlayer.builderCurrent(builder: ((context, playing) {
      return ListTile(
        leading: IconButton(
            icon: toggle
                ? const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 35,
                  ),
            onPressed: () {
              setState(() {
                // Here we changing the icon.
                toggle = !toggle;
              });
            }),
        title: Center(
          child: Text(
            widget.audioPlayer.getCurrentAudioTitle,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
        ),
        subtitle: Center(
          child: Text(
            widget.audioPlayer.getCurrentAudioArtist,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            showAddtoplaylistBox(context);
          },
          icon: const Icon(Icons.add_box_outlined),
          iconSize: 35,
          color: Colors.white,
        ),
      );
    }));
  }
}


