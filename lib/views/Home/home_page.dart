import 'package:flutter/material.dart';
import 'package:happy_place/Services/auth_service.dart';
import 'package:provider/provider.dart';
import '../../componentes/icon_button_bar.dart';
import '../../repository/google_sign_in.dart';
import '../carrosel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color(0xFFFFC61A),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.sensor_occupied_sharp),
                label: 'Meditação',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Palavra do dia',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.data_exploration),
                label: 'Humor diário',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music_sharp),
                label: 'Músicas',

              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            fixedColor: Colors.white,
          )),
      appBar: AppBar(
        title: const Text("Teste"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<AuthService>().logout();
              context.read<GoogleSignInHappyPlace>().logout();
            },
            child: const Text("logout")),
      ),
    );
  }
}
