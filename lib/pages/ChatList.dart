import 'package:flutter/material.dart';
import 'package:unimatch/Entities/User.dart';
import 'package:unimatch/widgets/ChatPage/ChatListPage.dart';
import 'package:unimatch/widgets/HomePage/CardStack.dart';
import 'package:unimatch/widgets/HomePage/MatchEngine.dart';
import 'package:unimatch/widgets/HomePage/MyAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyBottomAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyFloatingActionButton.dart';
import 'package:unimatch/widgets/UserProfilePage/ProfilePage.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: ' UniMatch '),
      body: Container(margin: EdgeInsets.only(bottom: 0), child: ChatLists()),
      bottomNavigationBar: MyBottomAppBar(currentIndex: 2),
    );
  }
}
