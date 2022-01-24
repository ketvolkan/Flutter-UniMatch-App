import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/utilities/texts.dart';
import 'package:unimatch/widgets/ChatPage/ChatListPage.dart';
import 'package:unimatch/widgets/ChatPage/MyCircleWidget.dart';
import 'package:unimatch/widgets/EditPhotoPage/SwipeScreen.dart';
import 'package:unimatch/widgets/HomePage/CardStack.dart';
import 'package:unimatch/widgets/HomePage/MatchEngine.dart';
import 'package:unimatch/widgets/HomePage/MyAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyBottomAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyFloatingActionButton.dart';
import 'package:unimatch/widgets/MessagePage/ChatDetailPage.dart';
import 'package:unimatch/widgets/UserProfilePage/ProfilePage.dart';

class EditPhoto extends StatefulWidget {
  EditPhoto({Key? key}) : super(key: key);

  @override
  State<EditPhoto> createState() => _EditPhotoState();
}

class _EditPhotoState extends State<EditPhoto> {
  @override
  void initState() {
    super.initState();
  }

  _EditPhotoState() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar(title: TitleText), body: SwipeScreen());
  }
}
