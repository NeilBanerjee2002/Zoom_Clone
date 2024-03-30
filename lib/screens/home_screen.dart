import 'package:flutter/material.dart';
import 'package:zoom_clone/Widgets/custom_button.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/screens/history_meeting_screen.dart';
import 'package:zoom_clone/screens/login_screen.dart';
import 'package:zoom_clone/screens/meeting_screen.dart';
import 'package:zoom_clone/utils/Home_screen_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Auth_Methods _auth_methods = Auth_Methods();
  int _page = 0;
  late List<Widget> pages;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
  void initState() {
    super.initState();
    pages = [
      MeetingScreen(),
      const HistoryMeetingScreen(),
      const Text('Contacts'),
      Custom_Button(
          text: "Log Out",
          onpressed: () {
            _auth_methods.SignOut();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Login_Screen()),
            );
          }
      )
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Meet and Chat'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          onTap: onPageChanged,
          currentIndex: _page,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank_outlined),
                label: 'Meet and chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'Meetings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Contacts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}

class HistoryMeeting extends StatelessWidget {
  const HistoryMeeting({
    super.key,
  });

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
    ]);
  }
}
