import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthscope/screens/Patient/Appoinment_screen/Appoinment.dart';
import 'package:healthscope/screens/Patient/PatientMyResultScreen/Patient_result_screen.dart';
import 'package:healthscope/screens/Patient/Patient profile/profile_screen.dart';
import 'package:healthscope/screens/Patient/Consulation_screen/Consultation.dart';
import 'package:healthscope/screens/Patient/PatientChat/Patient_chat.dart';
import '../constants.dart';
import '../enums.dart';

class PatientBottomNavBar extends StatelessWidget {
  const PatientBottomNavBar({
    Key key,
    @required this.PselectedMenu,
  }) : super(key: key);

  final MenuState PselectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.assignment_outlined,
                  color: MenuState.PatientResults == PselectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, PatientScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/consultation.svg",
                  color: MenuState.patientConsultation == PselectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, Consultation.routeName),
              ),
              IconButton(
                icon: Icon(
                  Icons.date_range,
                  color: MenuState.patientAppointment == PselectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, Appoinment.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Conversation.svg",
                  color: MenuState.Patient_Chat == PselectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, PatientChat.routeName);
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == PselectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, ProfileScreen.routeName),
              ),
            ],
          )),
    );
  }
}
