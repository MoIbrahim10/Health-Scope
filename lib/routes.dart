import 'package:flutter/widgets.dart';
import 'screens/Doctor/Doctor Requests/Request_screen.dart';
import 'package:healthscope/screens/complete_profile/complete_profile_screen.dart';
import 'package:healthscope/screens/complete_profile/complete_profile_screenP2.dart';
import 'package:healthscope/screens/complete_profile/complete_profile_screenD2.dart';
import 'package:healthscope/screens/forgot_password/forgot_password_screen.dart';
import 'package:healthscope/screens/Doctor/DoctorCurrentPatients/Doctor_currentpatient_screen.dart';
import 'package:healthscope/screens/Patient/PatientMyResultScreen/Patient_result_screen.dart';
import 'package:healthscope/screens/otp/otp_Paient_screen.dart';
import 'package:healthscope/screens/Patient/Patient profile/profile_screen.dart';
import 'package:healthscope/screens/sign_in/sign_in_screen.dart';
import 'package:healthscope/screens/splash/splash_screen.dart';
import 'package:healthscope/screens/otp/otp_doctor_screen.dart';
import 'package:healthscope/screens/Patient/Appoinment_screen/Appoinment.dart';
import 'package:healthscope/screens/Patient/Consulation_screen/Consultation.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/Doctor/DoctorCurrentPatients/PatientResust_dscreen.dart';
import 'package:healthscope/screens/Doctor/Doctor_chat/Doctor_chat.dart';
import 'package:healthscope/screens/Patient/PatientChat/Patient_chat.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  CompleteProfilePatientScreen2.routeName: (context) =>
      CompleteProfilePatientScreen2(),
  CompleteProfileDScreen2.routeName: (context) => CompleteProfileDScreen2(),
  OtpPScreen.routeName: (context) => OtpPScreen(),
  OtpDScreen.routeName: (context) => OtpDScreen(),
  DoctorScreen.routeName: (context) => DoctorScreen(),
  PatientScreen.routeName: (context) => PatientScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  Appoinment.routeName: (context) => Appoinment(),
  Consultation.routeName: (context) => Consultation(),
  PatientResultScreen.routeName: (context) => PatientResultScreen(),
  Request.routeName: (context) => Request(),
  Chat.routeName: (context) => Chat(),
  PatientChat.routeName: (context) => PatientChat(),
};
