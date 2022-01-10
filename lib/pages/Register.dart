import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/services/UserService.dart';
import 'package:unimatch/widgets/LoginRegisterPage/background.dart';

Size size = Size(0, 0);
String selectedValue = "";

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Register();
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  String dateOfBirth = "Date Of Birth";

  bool active = false;
  String dateTime = '';
  String description = "Write Sentence About You";
  String firstName = "";
  String gender = "";
  int id = 0;
  String lastName = "";
  String mail = "";
  String phoneNumber = "";
  bool verifiedAccount = false;
  String password = "";
  registerFunction() async {
    if (firstName == "" ||
        lastName == "" ||
        gender == "" ||
        mail == "" ||
        phoneNumber == "" ||
        password == "" ||
        dateTime == "") {
      EasyLoading.instance.maskColor = Colors.red.withOpacity(0.4);
      EasyLoading.showToast(
        "Please Do Not Leave Blank Space",
        duration: Duration(seconds: 3),
        dismissOnTap: true,
        toastPosition: EasyLoadingToastPosition.center,
        maskType: EasyLoadingMaskType.custom,
      );
    } else {
      User registeredUser = User(
          active: active,
          dateOfBirth: dateTime,
          description: description,
          firstName: firstName,
          gender: gender,
          id: id,
          lastName: lastName,
          mail: mail,
          phoneNumber: phoneNumber,
          verifiedAccount: verifiedAccount,
          password: password,
          userPhotos: []);
      var response = await registerUser(registeredUser);
      var resBody = json.decode(utf8.decode(response.bodyBytes));

      if (resBody['success'] == true) {
        EasyLoading.instance..maskColor = Colors.green.withOpacity(0.4);
        EasyLoading.showToast(
          "Registration Successful. Confirm your email!",
          duration: Duration(seconds: 3),
          dismissOnTap: true,
          toastPosition: EasyLoadingToastPosition.bottom,
          maskType: EasyLoadingMaskType.custom,
        );
        Navigator.pushReplacementNamed(context, "/");
      } else {
        EasyLoading.instance..maskColor = Colors.red.withOpacity(0.4);
        EasyLoading.showToast(
          resBody['message'].toString(),
          duration: Duration(seconds: 3),
          dismissOnTap: true,
          toastPosition: EasyLoadingToastPosition.center,
          maskType: EasyLoadingMaskType.custom,
        );
      }
    }
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 160,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "REGISTER",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(labelText: "First Name"),
                onChanged: (value) {
                  firstName = value;
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(labelText: "Last Name"),
                onChanged: (value) {
                  lastName = value;
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(labelText: "E-Mail"),
                onChanged: (value) {
                  mail = value;
                },
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: DropdownButton(
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                  gender = selectedValue;
                },
                items: dropdownItems,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(labelText: "Mobile Number"),
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))),
              alignment: Alignment.centerLeft,
              width: 355,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1962, 1, 1),
                        maxTime: DateTime(2004, 1, 1),
                        theme: DatePickerTheme(
                            headerColor: Colors.purple,
                            backgroundColor: Colors.white,
                            itemStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            doneStyle:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        onChanged: (date) {
                      print('change $date in time zone ' +
                          date.timeZoneOffset.inHours.toString());
                    }, onConfirm: (date) {
                      setState(() {
                        dateTime = date.toString();
                        dateOfBirth = "Date Of Birth : " +
                            date.toString().replaceAll("00:00:00.000", "");
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    dateOfBirth,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  )),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: RaisedButton(
                onPressed: registerFunction,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: 100,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: new LinearGradient(colors: [
                        Color.fromARGB(255, 255, 136, 34),
                        Color.fromARGB(255, 255, 177, 41)
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "SIGN UP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () =>
                    {Navigator.pushReplacementNamed(context, "/Login")},
                child: Text(
                  "Already Have an Account? Sign in",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        child: Text(
          "Gender",
          style: TextStyle(color: Colors.grey),
        ),
        value: ""),
    DropdownMenuItem(
        child: Text(
          "Women",
          style: TextStyle(color: Colors.grey),
        ),
        value: "K"),
    DropdownMenuItem(
        child: Text(
          "Men",
          style: TextStyle(color: Colors.grey),
        ),
        value: "E"),
  ];
  return menuItems;
}
