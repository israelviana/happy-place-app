import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/views/Profile/Widgets/list_option_profile.dart';
import 'package:happy_place/models/user_model.dart';
import 'package:happy_place/repository/shared_preferences_repository.dart';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser!;
  UserModel userDate = UserModel();
  Future? getData;

  @override
  void initState() {
    getData = _getUserDate();
    super.initState();
  }

  _getUserDate() async{
    await SharedPreferencesRepository().getUserData().then((value) {
      setState(() {
        userDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC61A),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: FutureBuilder(
              future: getData,
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios, size: 44)),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Transform.scale(
                            scale: 3,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.photoURL ?? "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
                            ),
                          ),
                          const SizedBox(height: 70),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Color(0xFFFFF4EA),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: AutoSizeText(user.displayName ?? userDate.name!, style: TextStyle(
                                color: Color(0xFF372A28),
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            )),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ListOptionProfile()
                        ],
                      )
                    ],
                  );
                }else{
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
      )
    );
  }
}
