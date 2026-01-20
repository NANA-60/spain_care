import 'package:flutter/material.dart';
import 'package:spinecare/features/auth/auth_controller.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/primary_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Reset Password', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                CustomTextField(hint: 'Email', controller: emailController, fillColor: AppColors.white, textStyle: const TextStyle(color: Colors.black)),
                const SizedBox(height: 20),
                PrimaryButton(title: 'Send Link', onPressed: () async {
                  await authController.sendResetPassword(emailController.text);
                  Navigator.pop(context);
                }, backgroundColor: AppColors.primary, textColor: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
