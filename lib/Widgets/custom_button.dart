import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class Custom_Button extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const Custom_Button({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpressed, child: Text(text, style: TextStyle(fontSize: 17,color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: buttonColor),);
  }
}
