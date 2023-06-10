import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/utils/decoration_container.dart';
import 'package:happy_place/views/Song/Widgets/list_playlists.dart';

import 'Widgets/list_songs.dart';


class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Utils().containerWithDecoration(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AutoSizeText("Sons relaxantes", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Color(0xFFFFF4EA)
              )),
              SizedBox(height: 20),
              ListSongs(),
              SizedBox(height: 20),
              AutoSizeText("Playlists", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Color(0xFFFFF4EA)
              )),
              SizedBox(height: 20),
              ListPlaylists()
            ],
          ),
      )
    );
  }
}
