import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(55, 42, 40, 0.7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText("Sons relaxantes", style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 35,
              color: Color(0xFFFFF4EA)
            ))
          ],
        ),
      ),
    );
  }
}
