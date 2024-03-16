import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirestoreMethods().meetingsHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.data == null){
            return Center(
              child: Text('No meetings found'),
            );
          }else {
            return ListView.builder(
              itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                    'Room Name : ${(snapshot.data! as dynamic).docs[index]['meetingName']}'),
                subtitle: Text('Joined on ${DateFormat.yMMMd((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}'),
              ),
            );
          }
        });
  }
}
