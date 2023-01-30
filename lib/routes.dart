import 'package:flutter/widgets.dart';
import 'package:flutter_trello/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_trello/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_trello/screens/home/home_screen.dart';
import 'package:flutter_trello/screens/login_success/login_success_screen.dart';
import 'package:flutter_trello/screens/otp/otp_screen.dart';
import 'package:flutter_trello/screens/profile/profile_screen.dart';
import 'package:flutter_trello/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_trello/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
