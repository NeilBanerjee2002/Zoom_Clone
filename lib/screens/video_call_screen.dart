import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
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
  @override
  void initState(){
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _auth_methods.user.displayName);
    super.initState();
  }
  _joinMeeting(){

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
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              hintText: 'Name',
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(16, 6, 0, 0)
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: _joinMeeting,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text('Join', style: TextStyle(fontSize: 16),),
          ),
        )
      ],)
    );
  }
}
