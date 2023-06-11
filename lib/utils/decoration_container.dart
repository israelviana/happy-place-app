import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  // Função para converter uma lista de DateTime em uma lista de String
  List<String> convertDateTimeListToStringList(List<DateTime> dateTimeList) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    return dateTimeList.map((dateTime) => formatter.format(dateTime.toUtc())).toList();
  }

  // Função para converter uma lista de String em uma lista de DateTime
  List<DateTime> convertStringListToDateTimeList(List<String> stringList) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    return stringList.map((string) => formatter.parse(string)).toList();
  }

}