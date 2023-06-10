import 'package:flutter/material.dart';
import 'package:happy_place/utils/map_music.dart';

import '../../../repository/url_launcher.dart';

class ListSongs extends StatefulWidget {
  const ListSongs({Key? key}) : super(key: key);

  @override
  State<ListSongs> createState() => _ListSongsState();
}

class _ListSongsState extends State<ListSongs> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: MapMusic().listSong1.length,
              itemBuilder: (BuildContext context, int index){
                return boxMusic(
                  image:  MapMusic().listSong1[index]["image"],
                  linkMusic:  MapMusic().listSong1[index]["link"]
                );
              }
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 80,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:  MapMusic().listSong2.length,
              itemBuilder: (BuildContext context, int index){
                return boxMusic(
                    image:  MapMusic().listSong2[index]["image"],
                    linkMusic:  MapMusic().listSong2[index]["link"]
                );
              }
          ),
        ),
      ],
    );
  }

  Widget boxMusic({required String image, required String linkMusic}){
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: GestureDetector(
        onTap: () => UrlLauncher().launchLink(url: linkMusic),
        child: CircleAvatar(
          minRadius: 40,
          backgroundImage: NetworkImage(image),
        ),
      ),
    );
  }

}
