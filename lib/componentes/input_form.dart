import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm({Key? key, required this.controller, required this.hintText, required this.title}) : super(key: key);
  final controller;
  final String? hintText;
  final String title;


  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: const TextStyle(fontFamily: "Josefin Sans", fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF372A28))),
        TextFormField(
          cursorColor: const Color(0xFFf0821e),
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 5),
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontFamily: "Josefin Sans", fontSize: 18, fontWeight: FontWeight.w700, color: Color.fromRGBO(255, 244, 234, 0.5)),
            fillColor: const Color.fromRGBO(55, 42, 40, 0.4),
            filled: true,
            border:  const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
          ),
          style: const TextStyle(
              color: Colors.black
          ),
        ),
      ],
    );
  }
}


