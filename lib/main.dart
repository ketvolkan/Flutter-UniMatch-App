import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:unimatch/routes/RouteGenerator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniMatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColorBrightness: Brightness.light,
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      onGenerateRoute: RouteGenerator.routeGenerator,
      builder: EasyLoading.init(),
    );
  }
}
