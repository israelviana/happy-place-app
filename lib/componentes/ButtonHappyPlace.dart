import 'package:flutter/material.dart';

enum TypeButton{
  primary,
  secondary
}

class ButtonHappyPlace extends StatefulWidget {
  ButtonHappyPlace({Key? key, required this.onTap, required this.title, required this.type}) : super(key: key);

  Function onTap;
  String title;
  TypeButton type;

  @override
  State<ButtonHappyPlace> createState() => _ButtonHappyPlaceState();
}

class _ButtonHappyPlaceState extends State<ButtonHappyPlace> {
  @override
  Widget build(BuildContext context){
    if(widget.type == TypeButton.primary)
      return buttonPrimary(onTap: widget.onTap, title: widget.title);
    if(widget.type == TypeButton.secondary)
      return buttonSecondary(onTap: widget.onTap, title: widget.title);
    return Text("butao nao encontrado");
  }

  Widget buttonPrimary({String? title, Function? onTap}){
    return GestureDetector(
      onTap: (){
        onTap!();
      },
      child: Container(
        width: 267,
        height: 41,
        decoration: BoxDecoration(
          color: const Color(0xFF372A28),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(title!, style: const TextStyle(fontFamily: "Josefin Sans", fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
        ),
      ),
    );
  }

  Widget buttonSecondary({String? title, Function? onTap}){
    return GestureDetector(
      onTap: (){
        onTap!();
      },
      child: Container(
        width: 267,
        height: 41,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Color(0xFF372A28))
        ),
        child: Center(
          child: Text(title!, style: const TextStyle(fontFamily: "Josefin Sans", fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF372A28))),
        ),
      ),
    );
  }

}
