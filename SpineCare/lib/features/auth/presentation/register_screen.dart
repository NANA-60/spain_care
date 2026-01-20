import 'package:flutter/material.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../routes.dart';
import '../auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // ثابت
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Icon(Icons.account_circle_outlined, size: 100, color: Colors.white),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Create a new account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(hint: 'Email', controller: emailController, fillColor: AppColors.white, textStyle: const TextStyle(color: Colors.black), hintStyle: TextStyle(color: Colors.black38)),
                      const SizedBox(height: 15),
                      CustomTextField(hint: 'Full Name', controller: nameController, fillColor: AppColors.white, textStyle: const TextStyle(color: Colors.black)
                          ,hintStyle: TextStyle(color: Colors.black38)),
                      const SizedBox(height: 15),
                      CustomTextField(hint: 'User Name', controller: userNameController, fillColor: AppColors.white, textStyle: const TextStyle(color: Colors.black),hintStyle: TextStyle(color: Colors.black38)),
                      const SizedBox(height: 15),
                      CustomTextField(hint: 'Password', isPassword: true, controller: passwordController, fillColor: AppColors.white, textStyle: const TextStyle(color: Colors.black),hintStyle: TextStyle(color: Colors.black38)),
                      const SizedBox(height: 15),
                      CustomTextField(hint: 'Repeat Password', isPassword: true, controller: passwordController, fillColor: AppColors.white, textStyle: const TextStyle(color: Colors.black),hintStyle: TextStyle(color: Colors.black38)),
                      const SizedBox(height: 25),
                      PrimaryButton(title: 'Create', onPressed: () async {
                        await authController.register(nameController.text, userNameController.text, emailController.text, passwordController.text);
                        Navigator.pushReplacementNamed(context, AppRoutes.login);
                      }, backgroundColor: AppColors.primary, textColor: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () { Navigator.pop(context); },
                  child: const Text('Have account? Login', style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
