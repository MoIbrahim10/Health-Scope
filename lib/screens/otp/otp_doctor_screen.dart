import 'package:flutter/material.dart';
import 'package:healthscope/size_config.dart';
import 'package:healthscope/screens/otp/components/body_doctor.dart';

import 'components/body_patient.dart';

class OtpDScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OTP Verification",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BodyD(),
    );
  }
}
