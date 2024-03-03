import 'package:flutter/material.dart';
import 'package:zoom_clone/Widgets/custom_button.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/main.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final Auth_Methods _auth_methods = Auth_Methods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Start or join a meeting', style: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold,
      ),),
          Image.asset('Assets/onboarding.jpg'),
          Padding(padding: EdgeInsets.symmetric(vertical: 34)),
          Custom_Button(text: 'Google Sign in', onpressed: () async{
            bool res = await _auth_methods.sign_in_with_google(context);
            if(res){
              Navigator.pushNamed(context, '/home');
            }
          },),
        ],
      ),
    );
  }
}
