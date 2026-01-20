import 'package:flutter/material.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../routes.dart';
import '../auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthController authController = AuthController();

  bool rememberMe = false;
  bool isLoading = false;

  void _login() async {
    setState(() => isLoading = true);

    await authController.login(
      emailController.text,
      passwordController.text,
      rememberMe,
    );

    setState(() => isLoading = false);

    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    // Force LTR + fixed colors for this screen
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.primary, // ثابت
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      border: Border.all(color: Colors.cyan.shade200, width: 5),
                      boxShadow: [
                        BoxShadow(color: Colors.cyan.shade200, offset: Offset(0, 5), spreadRadius: 5, blurRadius: 20)
                      ],
                      image: const DecorationImage(
                        image: AssetImage('images/img_primary.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'SPINE CARE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Text(
                    'YOUR WAY TO THE BEST CARE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.secondary, // ثابت
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        CustomTextField(
                          hint: 'Email',
                          controller: emailController,
                          autofocus: true,
                          // override to keep design consistent
                          fillColor: AppColors.white,
                          textStyle: const TextStyle(color: Colors.black),
                          hintStyle: const TextStyle(color: Colors.black45),
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          hint: 'Password',
                          isPassword: true,
                          controller: passwordController,
                          fillColor: AppColors.white,
                          textStyle: const TextStyle(color: Colors.black),
                          hintStyle: const TextStyle(color: Colors.black45),
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                          title: isLoading ? 'Loading...' : 'Login',
                          onPressed: isLoading ? () {} : _login,
                          backgroundColor: AppColors.primary, // ثابت
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  side: BorderSide(color: Colors.white,width: 1.5),
                                  activeColor: Colors.teal.shade400,
                                  checkColor: Colors.white,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value ?? false;
                                    });
                                  },
                                ),
                                const Text(
                                  'Remember me',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.forgotPassword);
                              },
                              child: const Text(
                                'Forgot password ?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.register);
                        },
                        child: const Text(
                          'Create account',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,decorationColor: Colors.white
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
