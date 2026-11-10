import 'package:fayton_design/presentation/ui/OTP/view/otp_page.dart';
import 'package:flutter/material.dart';

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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => OtpPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff2A2E37),
                minimumSize: Size(361, 46)
              ),
              child: Text(
                'Davam et',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16),
              ),
            ),
          ],
        ),
      ),
     )
    );
  }
}
