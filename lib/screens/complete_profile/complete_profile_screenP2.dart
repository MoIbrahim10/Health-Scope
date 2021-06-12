import 'package:flutter/material.dart';
import 'package:healthscope/constants.dart';
import 'package:healthscope/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthscope/components/custom_surfix_icon.dart';
import 'package:healthscope/components/default_button.dart';
import 'package:healthscope/components/form_error.dart';
import 'package:healthscope/screens/otp/otp_Paient_screen.dart';

class CompleteProfilePatientScreen2 extends StatelessWidget {
  static String routeName = "/patient complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: PatientFormBodyy(),
    );
  }
}

class PatientFormBodyy extends StatelessWidget {
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
                CompleteProfilePatientForm2(),
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

class CompleteProfilePatientForm2 extends StatefulWidget {
  @override
  _CompleteProfilePatientForm2State createState() =>
      _CompleteProfilePatientForm2State();
}

class _CompleteProfilePatientForm2State
    extends State<CompleteProfilePatientForm2> {
  final _formKey = GlobalKey<FormState>();
  final List<String> Errors = [];
  String BloodType;
  String Age;
  String Height;
  String Weight;
  String MedicalHistory;

  void addError({String error}) {
    if (!Errors.contains(error))
      setState(() {
        Errors.add(error);
      });
  }

  void removeError({String error}) {
    if (Errors.contains(error))
      setState(() {
        Errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildBloodTypeFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildAgeFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildHeightFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildWeightFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildMedicalHistoryFormField(),
          FormError(errors: Errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, OtpPScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildMedicalHistoryFormField() {
    return TextFormField(
      onSaved: (newValue) => MedicalHistory = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kMedicalHistoryNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kMedicalHistoryNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Medical History",
        hintText: "Enter your Medical History",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildWeightFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => Weight = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kWeightNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kWeightNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Weight",
        hintText: "Enter your Weight in Kg",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildHeightFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => Height = newValue,
      decoration: InputDecoration(
        labelText: "Height",
        hintText: "Enter your Height in cm",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildBloodTypeFormField() {
    return TextFormField(
      onSaved: (newValue) => BloodType = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kBloodTypeNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kBloodTypeNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Blood Type",
        hintText: "Enter your Blood Type",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildAgeFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => Age = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAgeNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAgeNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Age",
        hintText: "Enter your Age",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
