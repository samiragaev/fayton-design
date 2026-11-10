import 'package:fayton_design/presentation/ui/OTP/view/otp_body.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const SafeArea(child: OtpBody()),
    );
  }
}