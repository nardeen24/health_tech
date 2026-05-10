import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/core/widgets/primary_buttom.dart';
import 'package:health_tech/features/auth/cubit/auth_cubit.dart';
import 'package:health_tech/features/auth/cubit/auth_states.dart';
import 'package:health_tech/features/auth/widgets/custom_text_form_feild.dart';
import 'package:health_tech/features/auth/widgets/or_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

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
                    'Log in ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height * 0.01),
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
                    obscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.01),
                  //didnt have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: ColorManager.greyColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: ColorManager.primaryColor),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.02),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        Navigator.pushReplacementNamed(
                          context,
                          '/mainNavigation',
                        );
                      } else if (state is LoginErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)),
                        );
                      }
                    },
                    builder: (context, state) {
                      bool isLoading = state is LoginLoadingState;
                      return PraimaryButtom(
                        text: isLoading ? 'Logging in...' : 'Log in',
                        onpressed: isLoading
                            ? () {}
                            : () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().login(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  );
                                }
                              },
                      );
                    },
                  ),

                  SizedBox(height: height * 0.02),
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
