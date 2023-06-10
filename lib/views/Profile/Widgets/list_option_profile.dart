import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Services/auth_service.dart';
import '../../../../repository/google_sign_in_repository.dart';
import '../../../Services/auth_service.dart';

class ListOptionProfile extends StatefulWidget {
  const ListOptionProfile({Key? key}) : super(key: key);

  @override
  State<ListOptionProfile> createState() => _ListOptionProfileState();
}

class _ListOptionProfileState extends State<ListOptionProfile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
                onTap: () =>  index == 1 ? _logout() : (){},
                child: itemProfile(index: index)
            );
          }
      ),
    );
  }

  Widget itemProfile({required int index}){
    return SizedBox(
      height: 88,
      width: double.infinity,
      child: Column(
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: [
                index == 1 ? const Icon(Icons.exit_to_app)
                : const Icon(Icons.account_box),
                const SizedBox(width: 16),
                index == 1 ? const AutoSizeText("Sair", style: TextStyle(
                  color: Color(0xFF372A28),
                  fontSize: 14
                )) :
                const AutoSizeText("Sobre nós", style: TextStyle(
                    color: Color(0xFF372A28),
                    fontSize: 14
                )),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget Divider(){
    return Container(
      height: 1,
      color: Color(0xFF372A28),
    );
  }

  void _logout() async{
    await context.read<AuthService>().logout();
    await context.read<GoogleSignInHappyPlace>().logout().whenComplete(() {
      Navigator.pop(context);
    });
  }
}