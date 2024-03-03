import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/Home_screen_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Meet and Chat'),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
                onPressed: () {}, icon: Icons.video_call, text: 'New Meeting'),
            HomeMeetingButton(
                onPressed: () {},
                icon: Icons.add_box_outlined,
                text: 'Join Meeting'),
            HomeMeetingButton(
                onPressed: () {},
                icon: Icons.calendar_today,
                text: 'Schedule Meeting'),
            HomeMeetingButton(
                onPressed: () {},
                icon: Icons.arrow_upward_outlined,
                text: 'Share Screen'),
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
      ]),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank_outlined), label: 'Meet and chat')
          ]),
    );
  }
}
