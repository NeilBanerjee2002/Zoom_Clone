import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class MeetingOptions extends StatelessWidget {
  const MeetingOptions({super.key, required this.text, required this.isMute, required this.onChanged, required this.icon});
  final bool isMute;
  final String text;
  final Function(bool) onChanged;
  final Icon icon;
  @override

  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text, style: const TextStyle(fontSize: 16),),
          ),
          icon, Spacer(),
          Switch.adaptive(value: isMute, onChanged: onChanged,)
        ],
      ),
    );
  }
}
