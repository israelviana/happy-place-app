import 'package:flutter/material.dart';

class Utils{
  Widget containerWithDecoration({required Widget child}){
    return Container(
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
      child: child
    );
  }
}