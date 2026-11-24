import 'package:fayton_design/presentation/components/app_button.dart';
import 'package:fayton_design/presentation/core/phone_input_formatter.dart';
import 'package:fayton_design/presentation/ui/forgotten%20password/view/password_body.dart';
import 'package:fayton_design/presentation/ui/forgotten%20password/view/password_page.dart';
import 'package:fayton_design/presentation/ui/registration/view/registration_body.dart';
import 'package:flutter/material.dart';
import 'package:fayton_design/presentation/components/app_button.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 70),
              Image.asset('assets/images/fayton.png', width: 175, height: 55.8),
              SizedBox(height: 118.2),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Xoş gəldiniz!',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          textInputAction: TextInputAction.next,
                          inputFormatters: [PhoneInputFormatter()],
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            prefixIcon: const Padding(
                              padding: EdgeInsetsGeometry.only(
                                left: 16,
                                right: 4,
                              ),
                              child: Text(
                                '+994',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minHeight: 0,
                              minWidth: 0,
                            ),
                            hintText: '(__) ___ __ __',
                            hintStyle: TextStyle(color: Color(0xff8C8C8C)),
                            filled: true,
                            fillColor: const Color(0xFFF5F5F5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Şifrə',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PasswordPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Şifənizi unutmusunuz?',
                              style: TextStyle(
                                color: Color(0xff2F7AE9),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 140),
                        AppButton(text: 'Daxil ol', onPressed: () {}),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Hesabınız yoxdur?',
                              style: TextStyle(fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Hesab yaradın',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff2F7AE9),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
