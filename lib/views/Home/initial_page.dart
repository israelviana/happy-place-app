import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          children: [
            const AutoSizeText("Seja bem-vindo!", style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30
            )),
            Container(
              constraints: BoxConstraints(
                minHeight: 40,
                minWidth: 200,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const AutoSizeText("Precisando conversar?", style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    )),
                    const AutoSizeText("Sua vida é importante!", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    )),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Ligue para o Centro de Valorização da Vida\n',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                            ),
                          ),
                          TextSpan(
                            text: ' só discar 188 e ligar!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}
