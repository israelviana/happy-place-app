import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm({Key? key, this.controller, this.hintText}) : super(key: key);
  final controller;
  final String? hintText;


  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color(0xFFf0821e),
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 5),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: Colors.black
        ),
      ),
      style: TextStyle(
          color: Colors.black
      ),
    );
  }
}


