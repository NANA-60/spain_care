import 'package:flutter/material.dart';
import 'package:spinecare/core/settings/presentation/settings_screen.dart';
import 'package:spinecare/features/upload/presentation/forgot_password_screen.dart';

import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/register_screen.dart';
import 'features/home/home_screen.dart';
import 'features/upload/presentation/upload_screen.dart';
import 'features/result/result_screen.dart';
import 'features/upload/presentation/waiting_screen.dart';

class AppRoutes {
  static const login = '/';
  static const register = '/register';
  static const home = '/home';
  static const upload = '/upload';
  static const waiting = '/waiting';
  static const result = '/result';
  static const forgotPassword = '/forgot-password';
  static const settings = '/settings';


  static Map<String, WidgetBuilder> routes = {
    login: (_) => const LoginScreen(),
    register: (_) => const RegisterScreen(),
    home: (_) => const HomeScreen(),
    upload: (_) =>  UploadScreen(),
    waiting: (_) => const WaitingScreen(),
    result: (_) => const ResultScreen(),
    forgotPassword: (_) => ForgotPasswordScreen(),
    settings: (_) => const SettingsScreen(),


  };
}
