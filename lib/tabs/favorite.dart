import 'package:flutter/material.dart';
import 'package:music_player/widget/favorite_tile.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: const [
                    FavoriteListTile(
                      imagePath: 'asset/images/blinding lights.png',
                      song: 'Blinding Lights',
                      artist: 'The Weekend',
                    ),
                    FavoriteListTile(
                      imagePath: 'asset/images/Heat Waves.png',
                      song: 'Heat Waves',
                      artist: 'Glass Animals',
                    ),
                    FavoriteListTile(
                      imagePath: 'asset/images/Sunflower.jpeg',
                      song: 'Sunflower',
                      artist: 'Post Malone,Swae Lee',
                    ),
                    FavoriteListTile(
                      imagePath: 'asset/images/blinding lights.png',
                      song: 'Blinding Lights',
                      artist: 'The Weekend',
                    ),
                    FavoriteListTile(
                      imagePath: 'asset/images/Heat Waves.png',
                      song: 'Heat Waves',
                      artist: 'Glass Animals',
                    ),
                    FavoriteListTile(
                      imagePath: 'asset/images/Sunflower.jpeg',
                      song: 'Sunflower',
                      artist: 'Post Malone,Swae Lee',
                    ),
                    FavoriteListTile(
                      imagePath: 'asset/images/blinding lights.png',
                      song: 'Blinding Lights',
                      artist: 'The Weekend',
                    ),
                    FavoriteListTile(
                      imagePath: 'asset/images/Heat Waves.png',
                      song: 'Heat Waves',
                      artist: 'Glass Animals',
                    ),
                    FavoriteListTile(
                      imagePath: 'asset/images/Sunflower.jpeg',
                      song: 'Sunflower',
                      artist: 'Post Malone,Swae Lee',
                    ),
                    FavoriteListTile(
                      imagePath: 'asset/images/blinding lights.png',
                      song: 'Blinding Lights',
                      artist: 'The Weekend',
                    ),
                    FavoriteListTile(
                      imagePath: 'asset/images/Heat Waves.png',
                      song: 'Heat Waves',
                      artist: 'Glass Animals',
                    ),
                    FavoriteListTile(
                      imagePath: 'asset/images/Sunflower.jpeg',
                      song: 'Sunflower',
                      artist: 'Post Malone,Swae Lee',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
