import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class informationWidget extends StatelessWidget {
  informationWidget(
      {Key? key,
      required this.subtitle,
      required this.title,
      required this.icon,
      required this.iconColor,
      required this.clickFunction})
      : super(key: key);
  String title = "";
  String subtitle = "";
  IconData icon = Icons.ac_unit;
  Color iconColor = Colors.blue;
  VoidCallback clickFunction = () {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickFunction,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 35,
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[400],
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
