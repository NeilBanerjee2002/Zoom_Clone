import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page =0;
  onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BottomNavigationBar(
              selectedItemColor: Colors.white,
              onTap: onPageChanged,
              currentIndex: _page,
              unselectedItemColor: Colors.grey, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.comment_bank_outlined),
        label: 'Meet and chat'),
        BottomNavigationBarItem(icon: Icon(Icons.lock_clock),
            label: 'Meetings'),
            BottomNavigationBarItem(icon: Icon(Icons.person),
                label: 'Contacts'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),
                label: 'Settings'),
            BottomNavigationBarItem(icon: Icon(Icons.comment_bank_outlined),
                label: 'Meet and chat')
      ]),
    );
  }
}
