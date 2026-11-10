import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
      width: 52,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12),
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'OTP kod',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          Text(
            'Aşağıdakı nömrəyə OTP kod göndərilmişdir.',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 40),
          Pinput(
            length: 6,
            defaultPinTheme: defaultTheme,
            focusedPinTheme: defaultTheme.copyDecorationWith(
              border: Border.all(color: const Color(0xFF4A6CF7)),
            ),
            keyboardType: TextInputType.number,
            autofocus: true,
            onCompleted: (code) {
              debugPrint('Daxil edilən kod: $code');
            },
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff2A2E37),
              minimumSize: Size(361, 46)
            ),
            onPressed: () {},
            child: Text(
              'Təsdiqlə',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
