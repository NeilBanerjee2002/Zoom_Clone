import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/Widgets/meeting_option.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/utils/colors.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final Auth_Methods _auth_methods = Auth_Methods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState(){
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _auth_methods.user.displayName);
    super.initState();
  }
  void dispose(){
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
  }
  _joinMeeting(){
    _jitsiMeetMethods.createMeeting(roomName: meetingIdController.text, isAudioMuted: true, isVideoMuted: true);
  }
  onAudioMuted(bool val){
    setState(() {
      isAudioMuted = val;
    });
  }
  onVideoMuted(bool val){
    setState(() {
      isVideoMuted = val;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text('Join a meeting', style: TextStyle(fontSize: 18),),
        centerTitle: true,
      ),
      body: Column(children: [
        TextField(
          controller: meetingIdController,
          maxLines: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            fillColor: secondaryBackgroundColor,
            filled: true,
            hintText: 'Room ID',
            border: InputBorder.none,
            contentPadding: EdgeInsets.fromLTRB(16, 6, 0, 0)
          ),
        ),
        SizedBox(height: 10,),
        TextField(
          controller: nameController,
          maxLines: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              hintText: 'Name',
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(16, 6, 0, 0)
          ),
        ),
        SizedBox(height: 40),
        Container(
          height: 50,
          width: 200,
          child: Card(
            color: Colors.blueAccent,
            child: Center(
              child: InkWell(
                onTap: _joinMeeting,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Join', style: TextStyle(fontSize: 16,),),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 30,),
        MeetingOptions(text: "Enable Audio", isMute: true, onChanged: onAudioMuted, icon: Icon(Icons.mic),),
        MeetingOptions(text: "Enable Video", isMute: true, onChanged: onVideoMuted, icon: Icon(Icons.video_call),),
      ],)
    );
  }
}
