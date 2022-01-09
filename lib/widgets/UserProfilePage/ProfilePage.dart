import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/models/UserPhoto.dart';
import 'package:unimatch/pages/Profile.dart';
import 'package:unimatch/services/UserPhotoService.dart';
import 'package:unimatch/services/UserService.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, required this.profiles}) : super(key: key);
  User profiles;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    try {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.blue],
                      ),
                    ),
                    child: Column(children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      CircleAvatar(
                        radius: 65.0,
                        backgroundImage:
                            AssetImage(widget.profiles.userPhotos.first),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(widget.profiles.firstName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        widget.profiles.description,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ]),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.grey[200],
                      child: Center(
                          child: Column(
                        children: [
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.45,
                            left: 20.0,
                            right: 20.0,
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        child: Column(
                                      children: [
                                        Text(
                                          'Üniversite',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 14.0),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "Eklenecek",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        )
                                      ],
                                    )),
                                    Container(
                                      child: Column(children: [
                                        Text(
                                          'Birthday',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 14.0),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          widget.profiles.dateOfBirth
                                              .toString()
                                              .substring(0, 10),
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        )
                                      ]),
                                    ),
                                    Container(
                                        child: Column(
                                      children: [
                                        Text(
                                          'Age',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 14.0),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          (DateTime.now()
                                                      .difference(widget
                                                          .profiles.dateOfBirth)
                                                      .inDays /
                                                  365)
                                              .floor()
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                            child: Container(
                              width: 310.0,
                              height: 290.0,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Information",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[300],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.home,
                                          color: Colors.blueAccent[400],
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Guild",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "FairyTail, Magnolia",
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.auto_awesome,
                                          color: Colors.yellowAccent[400],
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Magic",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "Spatial & Sword Magic, Telekinesis",
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.pinkAccent[400],
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Loves",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "Eating cakes",
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.people,
                                          color: Colors.lightGreen[400],
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Team",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "Team Natsu",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      return Center(
        child: Text(e.toString()),
      );
    }
  }
}
