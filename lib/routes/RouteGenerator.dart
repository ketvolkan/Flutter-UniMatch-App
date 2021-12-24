import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unimatch/entities/User.dart';
import 'package:unimatch/pages/Chat.dart';
import 'package:unimatch/pages/ChatList.dart';
import 'package:unimatch/pages/Home.dart';
import 'package:unimatch/pages/Profile.dart';
import 'package:unimatch/pages/notFound404.dart';
import 'package:unimatch/widgets/MessagePage/ChatDetailPage.dart';

class RouteGenerator {
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

  static Route<dynamic>? routeGenerator(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return _routeOlustur(Home(), setting);
      case '/Profile':
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
