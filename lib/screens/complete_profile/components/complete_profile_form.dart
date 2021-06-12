import 'package:flutter/material.dart';
import 'package:healthscope/components/custom_surfix_icon.dart';
import 'package:healthscope/components/default_button.dart';
import 'package:healthscope/components/form_error.dart';
import 'package:healthscope/screens/complete_profile/complete_profile_screenP2.dart';
import 'package:healthscope/screens/complete_profile/complete_profile_screenD2.dart';
import 'package:healthscope/helper/keyboard.dart';
import 'package:healthscope/screens/sign_up/sign_up_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

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

  int selectedRadioTile2;
  @override
  void initState() {
    super.initState();
    selectedRadioTile2 = 0;
  }

  setSelectedRadioTile2(int val) {
    setState(() {
      selectedRadioTile2 = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(2)),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  value: 1,
                  groupValue: selectedRadioTile2,
                  title: Text("Doctor"),
                  onChanged: (val) {
                    print("Radio Tile pressed $val");
                    setSelectedRadioTile2(val);
                  },
                  activeColor: Colors.red,
                  selected: false,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: RadioListTile(
                  value: 2,
                  groupValue: selectedRadioTile2,
                  title: Text("Patient"),
                  onChanged: (val) {
                    print("Radio Tile pressed $val");
                    setSelectedRadioTile2(val);
                  },
                  activeColor: Colors.red,
                  selected: false,
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState.validate() && selectedRadioTile2 == 1) {
                _formKey.currentState.save();
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, CompleteProfileDScreen2.routeName);
              } else if (_formKey.currentState.validate() &&
                  selectedRadioTile2 == 2) {
                _formKey.currentState.save();

                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(
                    context, CompleteProfilePatientScreen2.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
