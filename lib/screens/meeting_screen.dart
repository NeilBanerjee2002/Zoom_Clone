import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/utils/Home_screen_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting()async{
    var random = Random();
    String roomName = (random.nextInt(10000000)+10000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: roomName,
        isAudioMuted: true,
        isVideoMuted: true);
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeMeetingButton(
              onPressed: createNewMeeting, icon: Icons.video_call, text: 'New\n Meeting'),
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
