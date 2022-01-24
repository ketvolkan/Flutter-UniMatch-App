import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:unimatch/utilities/texts.dart';
import 'package:unimatch/widgets/UserProfilePage/ProfilePage.dart';
import 'package:unimatch/widgets/UserProfilePage/informationWidget.dart';

class scrollWidget extends StatelessWidget {
  const scrollWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProfilePage widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
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
                  margin: EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: Column(
                          children: [
                            Text(
                              UniversityText,
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 14.0),
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
                              BirthdayText,
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 14.0),
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
                              AgeText,
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              (DateTime.now()
                                          .difference(DateTime.parse(
                                              widget.profiles.dateOfBirth))
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
                margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                child: Container(
                  width: 300.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        informationWidget(
                          icon: Icons.account_circle_outlined,
                          title: "Profil",
                          subtitle: "Bilgileri Güncelle",
                          iconColor: Colors.purple,
                          clickFunction: () {},
                        ),
                        informationWidget(
                          icon: Icons.add_a_photo_outlined,
                          title: "Fotoğraf",
                          subtitle: "Fotoğraf Ekle",
                          iconColor: Colors.yellow,
                          clickFunction: () {
                            Navigator.pushNamed(context, "/EditPhoto");
                          },
                        ),
                        informationWidget(
                          icon: Icons.settings,
                          title: "Ayarlar",
                          subtitle: "Uygulama Ayarları",
                          iconColor: Colors.blue,
                          clickFunction: () {},
                        ),
                        informationWidget(
                          icon: Icons.power_settings_new,
                          title: "Çıkış Yap",
                          subtitle: "",
                          iconColor: Colors.red,
                          clickFunction: () {
                            SessionManager().destroy();
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/Login", ModalRoute.withName('/'));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              )
            ],
          )),
        ),
      ),
    );
  }
}
