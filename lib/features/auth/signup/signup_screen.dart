import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/core/widgets/primary_buttom.dart';
import 'package:health_tech/features/auth/widgets/custom_text_form_feild.dart';
import 'package:health_tech/features/auth/widgets/or_divider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo_image.png',
                      width: width * 0.44,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: height * 0.035),
                  Text(
                    'Sign up',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomTextField(
                    hint: 'Name',
                    prefixIcon: Icons.person,
                    controller: nameController,
                  ),
                  CustomTextField(
                    hint: 'Email',
                    prefixIcon: Icons.person,
                    controller: emailController,
                  ),
                  CustomTextField(
                    hint: 'Password',
                    prefixIcon: Icons.key,
                    controller: passwordController,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Color(0xFF6A6A6A)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: ColorManager.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  PraimaryButtom(
                    text: 'SignUp',
                    onpressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                  SizedBox(height: height * 0.03),
                  OrDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
