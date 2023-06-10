import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/utils/decoration_container.dart';

class DailyWork extends StatefulWidget {
  const DailyWork({Key? key}) : super(key: key);

  @override
  State<DailyWork> createState() => _DailyWorkState();
}

class _DailyWorkState extends State<DailyWork> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Utils().containerWithDecoration(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AutoSizeText("Palavra do dia", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Color(0xFFFFF4EA)
              )),
            ],
          ),
      )
    );
  }
}
