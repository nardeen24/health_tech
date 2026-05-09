import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/core/widgets/primary_buttom.dart';
import 'package:health_tech/features/auth/cubit/auth_cubit.dart';
import 'package:health_tech/features/auth/cubit/auth_states.dart';
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
                  SizedBox(height: height * 0.033),
                  Text(
                    'Sign up',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height * 0.01),
                  CustomTextField(
                    hint: 'Name',
                    prefixIcon: Icons.person,
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    hint: 'Email',
                    prefixIcon: Icons.person,
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    hint: 'Password',
                    prefixIcon: Icons.key,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "already have an account?  ",
                        style: TextStyle(
                          color: const Color.fromRGBO(92, 92, 92, 1),
                        ),
                      ),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is SignupSuccessState) {
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        builder: (BuildContext context, AuthState state) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              "login",
                              style: TextStyle(
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.01),
                  PraimaryButtom(
                    text: 'SignUp',
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().signUp(
                          emailController.text,
                          passwordController.text,
                          nameController.text,
                        );
                      }
                    },
                  ),
                  SizedBox(height: height * 0.015),
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
