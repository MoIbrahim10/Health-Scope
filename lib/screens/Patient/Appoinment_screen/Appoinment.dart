import 'package:flutter/material.dart';
import 'package:healthscope/components/Patient _bottom_nav_bar.dart';
import 'package:healthscope/enums.dart';
import 'package:healthscope/screens/Patient/Appoinment_screen/body.dart';

class Appoinment extends StatelessWidget {
  static String routeName = "/Appoinment";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appoinment",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Body(),
      bottomNavigationBar:
          PatientBottomNavBar(PselectedMenu: MenuState.patientAppointment),
    );
  }
}
