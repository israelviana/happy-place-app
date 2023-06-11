import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_place/Services/auth_service.dart';
import 'package:happy_place/componentes/button_happy_place.dart';
import 'package:happy_place/componentes/input_form.dart';
import 'package:happy_place/models/user_model.dart';
import 'package:happy_place/repository/shared_preferences_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC61A),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 73),
          child: Column(
           children: [
             SvgPicture.asset("assets/images/logoHappyPlace.svg"),
             const SizedBox(height: 76),
             InputForm(controller: _nameController, hintText: "Nome", title: "Digite seu nome"),
             const SizedBox(height: 30),
             InputForm(controller: _emailController, hintText: "Email", title: "Digite seu e-mail"),
             const SizedBox(height: 30),
             InputForm(controller: _passwordController, hintText: "Senha", title: "Digite seu senha"),
             const SizedBox(height: 30),
             ButtonHappyPlace(
                 onTap: () => _register(),
                 title: "Finalizar cadastro",
                 type: TypeButton.primary),
             const SizedBox(height: 17),
           ],
          ),
        ),
      ),
    );
  }

  Future<void> _register() async {
    try {
      await context.read<AuthService>().register(_emailController.text, _passwordController.text);
      _saveUserData().whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Cadastro realizado com sucesso!"),
                backgroundColor: Colors.green)
        );
        Navigator.pop(context);
      });
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message), backgroundColor: Colors.red));
    }
  }

  Future<void> _saveUserData() async{
    await SharedPreferencesRepository().saveUserData(name: _nameController.text, email: _emailController.text, password: _passwordController.text);
  }

}
