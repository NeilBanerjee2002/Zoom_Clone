import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/Home_screen_button.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeMeetingButton(
              onPressed: () {}, icon: Icons.video_call, text: 'New\n Meeting'),
          HomeMeetingButton(
              onPressed: () {},
              icon: Icons.add_box_outlined,
              text: 'Join \nMeeting'),
          HomeMeetingButton(
              onPressed: () {},
              icon: Icons.calendar_today,
              text: 'Schedule \nMeeting'),
          HomeMeetingButton(
              onPressed: () {},
              icon: Icons.arrow_upward_outlined,
              text: 'Share \nScreen'),
        ],
      ),
      Expanded(
        child: Center(
          child: Text(
            'Create or join meeting with just a click',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    ]);;
  }
}
