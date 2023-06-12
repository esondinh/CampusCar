import 'package:CampusCar/constants/colors.dart';
import 'package:CampusCar/screens/admin/admin_main_screen.dart';
import 'package:CampusCar/screens/admin/login/admin_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map> userDrawerItems = [
  {'icon': FontAwesomeIcons.home, 'title': 'Home', 'index': 0},
  {'icon': FontAwesomeIcons.plus, 'title': 'New Vehicle', 'index': 1},
];

class DrawerScreen extends StatefulWidget {
  final Function currentScreenHandler;
  final int currentScreen;
  DrawerScreen(
      {@required this.currentScreenHandler, @required this.currentScreen});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  void autoLoginHandler() async {
    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => AdminMainScreen()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => AdminLogin()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryBlue,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              FaIcon(
                FontAwesomeIcons.car,
                color: Colors.white,
                size: 28,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Campus Car',
                style: TextStyle(
                    color: Colors.white, fontSize: 24, fontFamily: 'CarterOne'),
              ),
            ],
          ),
          Column(children: [
            ...userDrawerItems.map((element) => GestureDetector(
                  onTap: () {
                    widget.currentScreenHandler(element['index']);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: widget.currentScreen == element['index']
                            ? Colors.grey[100]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.only(top: 18, bottom: 18, left: 14),
                    child: Row(
                      children: [
                        Icon(
                          element['icon'],
                          color: widget.currentScreen == element['index']
                              ? Colors.black
                              : Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(element['title'],
                            style: TextStyle(
                                color: widget.currentScreen == element['index']
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                )),
            GestureDetector(
              onTap: autoLoginHandler,
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.only(top: 18, bottom: 18, left: 14),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.userCog,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Admin",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
            )
          ]),
          Container()
        ],
      ),
    );
  }
}
