import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtomBar extends StatelessWidget {
  final String text;
  final Icon icon;
  final bool? selected;
  final VoidCallback? onPressed;

  const IconButtomBar(
      {Key? key,
        required this.text,
        required this.icon,
        this.selected,
        this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 20,
      child: Column(
        children: [
          Expanded(
            child: IconButton(
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                icon: icon),
          ),
          Text(text, style: const  TextStyle(fontSize: 10))
        ],
      ),
    );
  }
}
