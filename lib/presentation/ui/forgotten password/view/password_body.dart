import 'package:fayton_design/presentation/ui/OTP/view/otp_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fayton_design/presentation/components/app_button.dart';

class PasswordBody extends StatelessWidget {
  const PasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Şifrəni yenilə',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text('Mobil nömrə', style: TextStyle(fontSize: 15)),
            SizedBox(height: 5),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(prefixText: '+994'),
            ),
            Spacer(),
            AppButton(text: 'Davam et', onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpPage() ));
            })])
        ),
        ),
      );
     
  }
}
