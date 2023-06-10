import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../repository/url_launcher.dart';

class ListPlaylists extends StatefulWidget {
  const ListPlaylists({Key? key}) : super(key: key);

  @override
  State<ListPlaylists> createState() => _ListPlaylistsState();
}

class _ListPlaylistsState extends State<ListPlaylists> {
  String url = "https://app.tunemymusic.com/pt/share/nquizv3xav?edit=true";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: GestureDetector(
          onTap: () => UrlLauncher().launchLink(url: url),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFFFC61A)
            ),
            child: SvgPicture.asset("assets/images/logoHappyPlace.svg"),
          )
      ),
    );
  }
}
