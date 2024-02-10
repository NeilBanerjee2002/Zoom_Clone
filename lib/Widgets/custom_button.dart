import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  final String text;
  const Custom_Button({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: Text(text, style: TextStyle(fontSize: 17),),style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),);
  }
}
