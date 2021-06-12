import 'package:flutter/material.dart';
import 'package:healthscope/size_config.dart';

import 'components/body_patient.dart';

class OtpPScreen extends StatelessWidget {
  static String routeName = "/otp patient";
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
      body: Body(),
    );
  }
}
