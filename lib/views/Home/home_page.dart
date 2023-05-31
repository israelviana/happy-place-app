import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/Services/auth_service.dart';
import 'package:happy_place/controller/controller_home_page.dart';
import 'package:happy_place/router.dart';
import 'package:happy_place/views/Profile/profile.dart';
import 'package:provider/provider.dart';
import '../../componentes/icon_button_bar.dart';
import '../../repository/google_sign_in.dart';


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
    final user = FirebaseAuth.instance.currentUser!;
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFFC61A),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color(0xFF372A28),
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
      body: SafeArea(
          child: SizedBox(
            height: mediaQuery.height,
            width: mediaQuery.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, profilePageRoute);
                        },
                        child: CircleAvatar(
                            backgroundImage: NetworkImage(user.photoURL ?? "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
                            minRadius: 25,
                        ),
                      ),
                    ],
                  ),
                ),
               ControllerHomePage().currentPage(currentIndexPage: _selectedIndex)
              ],
            ),
          )
      )
    );
  }
}

