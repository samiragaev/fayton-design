import 'package:fayton_design/presentation/ui/forgotten%20password/view/password_body.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: PasswordBody()),);
  }
}