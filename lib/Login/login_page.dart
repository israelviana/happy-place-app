import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_place/Components/input_form.dart';
import 'package:happy_place/Services/auth_service.dart';
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
  late String title;
  late String titleButton;
  late String toggleButton;


  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool action){
    setState(() {
      isLogin = action;
      if(isLogin){
        title = 'Seja bem-vindo!';
        titleButton = 'Entrar';
        toggleButton = 'Cadastre-se agora.';
      }else{
        title = 'Cadastre-se agora!';
        titleButton = 'Cadastrar';
        toggleButton = 'Voltar ao Login.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
              loginPage(),
        ]))
      ],
    )));
  }

  Widget loginPage() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 73),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/imageLoginPng.png",
              width: 280, height: 280),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          InputForm(
              controller: _emailController, hintText: "Digite seu e-mail"),
          const SizedBox(height: 20),
          InputForm(
              controller: _passwordController, hintText: "Digite sua senha"),
          const SizedBox(height: 40),
          ElevatedButton(
              onPressed: () {
                if(isLogin){
                  login();
                }else{
                  register();
                }
              },
              child: Center(
                child: Text(titleButton),
              )),
          TextButton(onPressed: () => setFormAction(!isLogin), child: Text(toggleButton))
        ],
      ),
    );
  }

  login() async{
    try{
      await context.read<AuthService>().login(_emailController.text, _passwordController.text);
    }on AuthException catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  register() async{
    try{
      await context.read<AuthService>().register(_emailController.text, _passwordController.text);
    }on AuthException catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
