import 'package:flutter/material.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/widgets/ChatPage/MyCircleWidget.dart';

class ChatLists extends StatelessWidget {
  ChatLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          String _imageUrl = 'assets/photo_1.jpg';
          return GestureDetector(
            onTap: () {
              var choosen = null;
              Navigator.pushNamed(context, '/Chat', arguments: choosen);
            },
            child: Card(
              elevation: 0,
              color: Colors.white.withOpacity(0),
              child: Container(
                decoration: index % 2 == 0
                    ? BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.blue,
                              Colors.white
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      )
                    : BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.blue,
                              Colors.white
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                child: ListTile(
                  title: Text(
                    "Volkan Ket",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  subtitle: Text(
                    "Last Sended Message",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: MyCircleWidget(_imageUrl),
                  trailing: Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 5,
        separatorBuilder: (context, index) {
          if ((index + 1) % 2 == 0)
            return SizedBox();
          else
            return SizedBox();
        },
      ),
    );
  }
}
