import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService(){
    _authCheck();
  }

  void _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  void _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  Future<void> register(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _getUser();
    }on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        throw AuthException('Senha muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email ja esta cadastrado!');
      }
    }
  }

  Future<void> login(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    }on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found') {
        throw AuthException('Email nao encontrado. Cadastre-se!');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta!');
      }
    }
  }

  Future<void> logout() async{
    await _auth.signOut();
    _getUser();
  }
}