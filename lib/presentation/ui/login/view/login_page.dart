import 'package:fayton_design/presentation/ui/login/view/login_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child:  LoginBody()));
  }
}
