import 'package:flutter/material.dart';
import 'package:healthscope/constants.dart';
import 'package:healthscope/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthscope/components/default_button.dart';
import 'package:healthscope/components/form_error.dart';
import 'package:healthscope/screens/otp/otp_doctor_screen.dart';

class CompleteProfileDScreen2 extends StatelessWidget {
  static String routeName = "/Doctor_complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: DBody2(),
    );
  }
}

class DBody2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text("Complete Profile", style: headingStyle),
                Text(
                  "Complete your details or continue  \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                CompleteProfileDForm2(),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  "By continuing your confirm that you agree \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompleteProfileDForm2 extends StatefulWidget {
  @override
  _CompleteProfileDForm2State createState() => _CompleteProfileDForm2State();
}

class _CompleteProfileDForm2State extends State<CompleteProfileDForm2> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String Speciality;
  String DailyPractice;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildSpecialityFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildDailyPracticeFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, OtpDScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildDailyPracticeFormField() {
    return TextFormField(
      onSaved: (newValue) => DailyPractice = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: KDailyPracticeNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: KDailyPracticeNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "DailyPractice",
        hintText: "Enter your DailyPractice",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildSpecialityFormField() {
    return TextFormField(
      onSaved: (newValue) => Speciality = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: KSpecialityNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: KSpecialityNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Speciality",
        hintText: "Enter your Speciality",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
