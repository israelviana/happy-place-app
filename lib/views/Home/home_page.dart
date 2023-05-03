import 'package:flutter/material.dart';
import 'package:happy_place/Services/auth_service.dart';
import 'package:provider/provider.dart';
import '../../componentes/icon_button_bar.dart';
import '../../repository/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          padding: const EdgeInsets.only(top: 10, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: const IconButtomBar(
                    text: "Meditação",
                    icon: const Icon(Icons.sensor_occupied_sharp),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: const IconButtomBar(
                    text: "Palavra do dia",
                    icon: const Icon(Icons.book),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: const IconButtomBar(
                    text: "Home",
                    icon: const Icon(Icons.house),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: const IconButtomBar(
                    text: "Humor diário",
                    icon: const Icon(Icons.data_exploration),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: const IconButtomBar(
                    text: "Músicas",
                    icon: const Icon(Icons.library_music_sharp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Happy place"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          context.read<AuthService>().logout();
          context.read<GoogleSignInHappyPlace>().logout();
        }, child: Text("logout")),
      ),
    );
  }
}
