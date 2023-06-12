import 'package:CampusCar/screens/admin/drawer/admin_drawer_screen.dart';
import 'package:CampusCar/screens/admin/home/admin_dashboard_screen.dart';
import 'package:CampusCar/screens/admin/vehicle/admin_add_vehicle_screen.dart';
import 'package:CampusCar/screens/admin/vehicle/admin_logs_screen.dart';
import 'package:CampusCar/screens/admin/vehicle/admin_vehicles_screen.dart';
import 'package:flutter/material.dart';

class AdminMainScreen extends StatefulWidget {
  @override
  _AdminMainScreenState createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  int currentScreen = 0;

  getTheScreen() {
    switch (currentScreen) {
      case 0:
        return AdminDashboardScreen(
          currentScreenHandler: changeCurrentScreen,
        );
        break;
      case 1:
        return AdminLogsScreen();
        break;
      case 2:
        return AdminVehiclesScreen();
        break;
      case 3:
        return AdminAddVehicleScreen();
        break;

      default:
        return AdminAddVehicleScreen();
        break;
    }
  }

  changeCurrentScreen(int index) {
    setState(() {
      currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AdminDrawerScreen(
              currentScreenHandler: changeCurrentScreen,
              currentScreen: currentScreen),
          getTheScreen(),
        ],
      ),
    );
  }
}
