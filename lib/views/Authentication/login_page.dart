import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_place/Services/auth_service.dart';
import 'package:happy_place/componentes/button_happy_place.dart';
import 'package:happy_place/componentes/input_form.dart';
import 'package:happy_place/repository/google_sign_in_repository.dart';
import 'package:happy_place/router.dart';
import 'package:happy_place/views/Home/home_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  bool isLogin = true;
  late String titleButton;
  late String toggleButton;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFC61A),
        body: SafeArea(
            child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else if (snapshot.hasError) {
              return Text("deu errado no login with google!");
            } else {
              return CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    loginPage(),
                  ]))
                ],
              );
            }
          },
        )));
  }

  Widget loginPage() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 73),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/logoHappyPlace.svg"),
          const SizedBox(height: 76),
          InputForm(controller: _emailController, hintText: "Email", title: "Digite seu e-mail"),
          const SizedBox(height: 30),
          InputForm(controller: _passwordController, hintText: "Senha", title: "Digite seu senha"),
          const SizedBox(height: 30),
          ButtonHappyPlace(
              onTap: () => login(),
              title: "Acessar",
              type: TypeButton.primary),
          const SizedBox(height: 30),
          ButtonHappyPlace(
              onTap: () => Navigator.pushNamed(context, registerPageRoute),
              title: "Cadastrar",
              type: TypeButton.secondary),
          const SizedBox(height: 17),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 100, height: 1, color: Color(0xFF372A28)),
              const SizedBox(width: 3),
              const Text("Ou acesse com",
                  style: TextStyle(
                      fontFamily: "Josefin Sans",
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF372A28))),
              const SizedBox(width: 3),
              Container(width: 100, height: 1, color: Color(0xFF372A28)),
            ],
          ),
          const SizedBox(height: 17),
          GestureDetector(
            onTap: () => loginWithGoogle(),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(55, 42, 40, 0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Transform.scale(
                  scale: 0.8,
                  child: SvgPicture.asset("assets/images/googleLogo.svg",
                      height: 40, width: 40)),
            ),
          )
        ],
      ),
    );
  }

  login() async {
    try {
      await context.read<AuthService>().login(_emailController.text, _passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Seja bem-vindo!"),
              backgroundColor: Colors.green)
      );
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message), backgroundColor: Colors.red,));
    }
  }

  loginWithGoogle() {
    try {
      context.read<GoogleSignInHappyPlace>().googleLogin();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
