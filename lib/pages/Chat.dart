import 'package:flutter/material.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/widgets/ChatPage/ChatListPage.dart';
import 'package:unimatch/widgets/ChatPage/MyCircleWidget.dart';
import 'package:unimatch/widgets/HomePage/CardStack.dart';
import 'package:unimatch/widgets/HomePage/MatchEngine.dart';
import 'package:unimatch/widgets/HomePage/MyAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyBottomAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyFloatingActionButton.dart';
import 'package:unimatch/widgets/MessagePage/ChatDetailPage.dart';
import 'package:unimatch/widgets/UserProfilePage/ProfilePage.dart';

class Chat extends StatefulWidget {
  Chat({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  State<Chat> createState() => _ChatState(user: user);
}

class _ChatState extends State<Chat> {
  _ChatState({required this.user}) {}
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          elevation: 20,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyCircleWidget(user.data[0].userPhotoUserId[0].data[0].photoUrl),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                      user.data[0].firstName + " " + user.data[0].lastName)),
            ],
          )),
      body: Container(
          margin: EdgeInsets.only(bottom: 0), child: ChatDetailPage()),
    );
  }
}
