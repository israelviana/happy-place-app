import 'dart:async';
import 'package:flutter/material.dart';

class Carrosel extends StatefulWidget {
  const Carrosel({Key? key}) : super(key: key);

  @override
  State<Carrosel> createState() => _CarroselState();
}

class _CarroselState extends State<Carrosel> {
  late PageController pngController;
  late Timer _timer;

  final List<String> listInformation = ["Aguarde um momento", "Estamos entrando em contato com seu banco", "Estamos quase lá", "Aguarde mais um pouco"];
  @override
  void initState() {
    pngController = PageController();
    _nextItemCarrosel();
    super.initState();
  }

  @override
  void dispose() {
    pngController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              child: PageView(
                controller: pngController,
                children: listInformation.map((e) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(e),
                  ],
                )).toList()
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  void _nextItemCarrosel(){
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      int? currentView = pngController.page?.round();
      if(currentView! != (listInformation.length - 1)){
        pngController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      }else{
        pngController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutCirc
        );
      }
    });
  }

  Widget _buildBullets() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red
            ),
          )
        ],
      ),
    );
  }
}
