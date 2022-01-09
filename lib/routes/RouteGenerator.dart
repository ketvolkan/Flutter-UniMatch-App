import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/pages/Chat.dart';
import 'package:unimatch/pages/ChatList.dart';
import 'package:unimatch/pages/Home.dart';
import 'package:unimatch/pages/Profile.dart';
import 'package:unimatch/pages/Login.dart';
import 'package:unimatch/pages/Register.dart';
import 'package:unimatch/pages/notFound404.dart';
import 'package:unimatch/widgets/MessagePage/ChatDetailPage.dart';

dynamic login;

class RouteGenerator {
  RouteGenerator() {
    login = getLogin();
  }
  static Route<dynamic>? _routeOlustur(Widget widget, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        builder: (context) => widget,
        settings: settings,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        builder: (context) => widget,
        settings: settings,
      );
    } else {
      return CupertinoPageRoute(
        builder: (context) => widget,
        settings: settings,
      );
    }
  }

  dynamic getLogin() async {
    return await SessionManager().get("id");
  }

  static Route<dynamic>? routeGenerator(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        if (login == true) {
          return _routeOlustur(Home(), setting);
        } else {
          return _routeOlustur(LoginScreen(), setting);
        }
      case '/Login':
        return _routeOlustur(LoginScreen(), setting);
      case '/Home':
        return _routeOlustur(Home(), setting);
      case '/Register':
        return _routeOlustur(RegisterScreen(), setting);
      case '/Profile':
        var id = setting.arguments as int;
        return _routeOlustur(Profile(), setting);
      case '/ChatList':
        return _routeOlustur(ChatList(), setting);
      case '/Chat':
        var choosen = setting.arguments as User;
        return _routeOlustur(
            Chat(
              user: choosen,
            ),
            setting);
      default:
        return MaterialPageRoute(
          builder: (context) => notFound404(),
        );
    }
  }
}
