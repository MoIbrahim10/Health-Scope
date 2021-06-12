import 'package:flutter/material.dart';
import 'package:healthscope/components/Patient%20_bottom_nav_bar.dart';
import 'package:healthscope/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Body(),
      bottomNavigationBar:
          PatientBottomNavBar(PselectedMenu: MenuState.profile),
    );
  }
}
