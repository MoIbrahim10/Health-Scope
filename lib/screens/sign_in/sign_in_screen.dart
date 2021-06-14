import 'package:flutter/material.dart';
import 'package:healthscope/components/no_account_text.dart';
import 'package:healthscope/components/socal_card.dart';
import 'package:healthscope/components/custom_surfix_icon.dart';
import 'package:healthscope/components/form_error.dart';
import 'package:healthscope/helper/keyboard.dart';
import 'package:healthscope/screens/forgot_password/forgot_password_screen.dart';
import 'package:healthscope/screens/Doctor/DoctorCurrentPatients/Doctor_currentpatient_screen.dart';
import 'package:healthscope/screens/Patient/PatientMyResultScreen/Patient_result_screen.dart';
import 'package:healthscope/components/default_button.dart';
import 'package:healthscope/size_config.dart';
import 'package:healthscope/constants.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  int val;
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
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Color(0XFFEB1555),
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

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

  int selectedRadioTile;

  bool rememberPasswordValue = false;
  bool isPasswordInvisible = true;
  String passwordValue;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  value: 1,
                  groupValue: selectedRadioTile,
                  title: Text("Doctor"),
                  onChanged: (val) {
                    print("Radio Tile pressed $val");
                    setSelectedRadioTile(val);
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
                  groupValue: selectedRadioTile,
                  title: Text("Patient"),
                  onChanged: (val) {
                    print("Radio Tile pressed $val");
                    setSelectedRadioTile(val);
                  },
                  activeColor: Colors.red,
                  selected: false,
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate() && selectedRadioTile == 1) {
                _formKey.currentState.save();

                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, DoctorScreen.routeName);
              } else if (_formKey.currentState.validate() &&
                  selectedRadioTile == 2) {
                _formKey.currentState.save();

                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, PatientScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          icon: Icon(
            !isPasswordInvisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              isPasswordInvisible = !isPasswordInvisible;
            });
          },
        ),
      ),
      obscureText: isPasswordInvisible,
      onSaved: (newValue) {
        passwordValue = newValue;
      },
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
