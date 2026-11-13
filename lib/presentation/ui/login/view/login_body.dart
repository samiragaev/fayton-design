import 'package:fayton_design/presentation/ui/forgotten%20password/view/password_body.dart';
import 'package:fayton_design/presentation/ui/forgotten%20password/view/password_page.dart';
import 'package:fayton_design/presentation/ui/registration/view/registration_body.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});

  //TODO: const əlavə etmək lazımdır.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Spacer(),
              Container(
                child: Image.asset(
                  'assets/images/fayton.png',
                  width: 175,
                  height: 55.8,
                ),
              ),
              Spacer(),
              SizedBox(height: 25),
              SizedBox(
                height: 56,
                width: 361,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixText: '+994',
                    hintText: '(__) ___ __ __',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //TODO: TextFieldi komponentə çevir və eyni şeyləri yazma burda digər Textfildlerla eyni şeylər çoxdur.
              SizedBox(
                height: 56,
                width: 361,
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Şifrə',
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 205),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PasswordPage()),
                    );
                  },
                  child: Text(
                    'Şifrəni unutmusunuz?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Spacer(),
              //TODO: ElevatedButtoni komponentə çevir. Adı primary button olsun.
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff2A2E37),
                  minimumSize: Size(361, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(25),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Daxil ol',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Text(
                      'Hesabınız yoxdur?',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Hesab yaradın',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
