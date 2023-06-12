import 'package:CampusCar/enum/direction.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Utils {
  static int directionToNum(Direction direction) {
    switch (direction) {
      case Direction.Entering:
        return 0;
      case Direction.Leaving:
        return 1;
      default:
        return 0;
    }
  }

  static Direction numToDirection(int number) {
    switch (number) {
      case 0:
        return Direction.Entering;
      case 1:
        return Direction.Leaving;
      default:
        return Direction.Entering;
    }
  }

  static String numToString(int number) {
    switch (number) {
      case 0:
        return "Entering";
      case 1:
        return "Leaving";
      default:
        return "Entering";
    }
  }

  static showFlashMsg(
      {FlashStyle style = FlashStyle.floating,
      String message,
      Color color = Colors.greenAccent,
      context}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: color,
          brightness: Brightness.light,
          boxShadows: [BoxShadow(blurRadius: 4)],
          barrierBlur: 3.0,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          style: style,
          position: FlashPosition.top,
          child: FlashBar(
            title: Text(
              color == Colors.redAccent ? 'Error' : 'Success',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            message: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
            primaryAction: FlatButton(
              onPressed: () => controller.dismiss(),
              child: FaIcon(FontAwesomeIcons.times, color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  static bool isExpired(String date) {
    if (DateTime.parse(date).compareTo(DateTime.now()) > 0)
      return false;
    else
      return true;
  }
}
