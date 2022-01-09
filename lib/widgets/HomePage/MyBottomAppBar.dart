import 'package:flutter/material.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({required this.currentIndex, Key? key})
      : super(key: key);
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: [0.0, 0.8],
          tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 20,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, "/Profile");
              break;
            case 1:
              Navigator.pushReplacementNamed(context, "/Home");
              break;
            case 2:
              Navigator.pushReplacementNamed(context, "/ChatList");
              break;
            default:
              Navigator.pushReplacementNamed(context, "/");
          }
        },
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 50,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.white),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department_outlined),
            title: Text(
              "Matches",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            title: Text(
              "Message",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
