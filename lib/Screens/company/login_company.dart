import 'package:flutter/material.dart';
import 'package:gym_app/Services/api.dart';
import 'package:gym_app/Widgets/back_button_title.dart';
import 'package:gym_app/responsive.dart';

import '../../Utils/color.dart';
import '../../Widgets/big_text.dart';
import '../../Widgets/bottom_nav_bar_company.dart';
import '../../Widgets/textfield_login.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future login() async {
    final response = await API().login(
      email: emailController.text,
      password: passwordController.text,
    );

    debugPrint('$response');
  }

  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            // height: double.infinity,
            margin: const EdgeInsets.all(5),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BackButtonAndTitle(title: ""),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(right: 35),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: BigText(
                        text: "Log in",
                        color: AppColor.primaryTextColor,
                        fontSize: 22,
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto_M',
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: TextFieldLogin(
                      controller: emailController,
                      onValidator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Enter the email';
                        }
                        return null;
                      },
                      hintText: "Enter your Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: TextFieldLogin(
                      obscureText: passwordVisible,
                      onValidator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Enter the password';
                        }
                        return null;
                      },
                      controller: passwordController,
                      hintText: "Enter your Password",
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (passwordVisible) {
                                passwordVisible = false;
                              } else {
                                passwordVisible = true;
                              }
                            });
                          },
                          child: Icon(
                            passwordVisible == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColor.bgContainerColor.withOpacity(.5),
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: ElevatedButton(
                      onPressed: () {
                        // if (formKey.currentState!.validate()) {
                        //   login();
                        // }
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          CompanyHomeScreen.routeName,
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 30),
                      ),
                      child: const BigText(
                        text: "LOG IN",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
      notMobile: const Scaffold(),
    );
  }
}
