import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gym_app/Screens/company/login_company.dart';
import 'package:gym_app/Widgets/back_button_title.dart';
import 'package:gym_app/responsive.dart';
import 'package:native_toast/native_toast.dart';

import '../../Services/api.dart';
import '../../Utils/color.dart';
import '../../Widgets/big_text.dart';
import '../../Widgets/text_fiield_system.dart';
import '../../constants.dart';

class CompanySystemScreen extends StatefulWidget {
  static const String routeName = '/company_system';
  const CompanySystemScreen({super.key});

  @override
  State<CompanySystemScreen> createState() => _CompanySystemScreenState();
}

class _CompanySystemScreenState extends State<CompanySystemScreen> {
  TextEditingController companyNameController = TextEditingController(),
      managerNameController = TextEditingController(),
      addressController = TextEditingController(),
      phoneController = TextEditingController();

  Future orderSystem() async {
    EasyLoading.show();
    final response = await API().postRequest(
      url: '${baseApiUrl}company/register',
      body: {
        'name': companyNameController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'manager': managerNameController.text,
        'type': '$isChoose',
      },
    );
    EasyLoading.dismiss();

    if (response['code'] == 200) {
      companyNameController.clear();
      managerNameController.clear();
      addressController.clear();
      phoneController.clear();
      isChoose = 0;
      setState(() {});
      showDialog(
        context: context,
        builder: (context) => Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 240,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                BigText(
                  text: "The order sent successfully\nwe will call you within",
                  color: Colors.black,
                  fontSize: 18,
                  textAlign: TextAlign.center,
                  height: 1.2,
                ),
                BigText(
                  text: "24 hours",
                  color: AppColor.primaryTextColor,
                  height: 1.2,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      NativeToast().makeText(
        message: response['message'],
        duration: NativeToast.longLength,
      );
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int isChoose = 0;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButtonAndTitle(
                    title: "Company",
                    color: AppColor.textColor,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 35),
                        BigText(
                          text: "Fill out the following",
                          color: AppColor.textColor,
                        ),
                        const SizedBox(height: 20),
                        TextFieldSystem(
                          hintText: "Company Name",
                          keyboardType: TextInputType.text,
                          onValidator: (input) {
                            if (input == null || input.isEmpty) {
                              return "Enter Company Name";
                            } else {
                              return null;
                            }
                          },
                          controller: companyNameController,
                        ),
                        const SizedBox(height: 25),
                        TextFieldSystem(
                          hintText: "Manager Name",
                          keyboardType: TextInputType.name,
                          onValidator: (input) {
                            if (input == null || input.isEmpty) {
                              return "Enter Manager Name";
                            } else {
                              return null;
                            }
                          },
                          controller: managerNameController,
                        ),
                        const SizedBox(height: 25),
                        TextFieldSystem(
                          hintText: "Phone Number",
                          keyboardType: TextInputType.phone,
                          onValidator: (input) {
                            if (input == null || input.isEmpty) {
                              return "Enter Phone Number";
                            } else {
                              return null;
                            }
                          },
                          controller: phoneController,
                        ),
                        const SizedBox(height: 25),
                        TextFieldSystem(
                          hintText: "Address Company",
                          keyboardType: TextInputType.text,
                          onValidator: (input) {
                            if (input == null || input.isEmpty) {
                              return "Enter Address Company";
                            } else {
                              return null;
                            }
                          },
                          controller: addressController,
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: BigText(
                              text: "Choose Company Type",
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            2,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 7,
                                      color: AppColor.bgContainerColor
                                          .withOpacity(.25),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: AppColor.bgColor,
                                  borderRadius: BorderRadius.circular(20),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {
                                      setState(() {
                                        isChoose = index;
                                      });
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: isChoose == index
                                            ? Border.all(
                                                width: 1,
                                                color: AppColor.primaryColor,
                                              )
                                            : Border.all(
                                                width: 1,
                                                color: AppColor.bgContainerColor
                                                    .withOpacity(.5),
                                              ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            index == 0
                                                ? 'assets/icons/supplement_icon.png'
                                                : 'assets/icons/clothes_icon.png',
                                            width: 50,
                                            height: 50,
                                            color: isChoose == index
                                                ? AppColor.primaryTextColor
                                                : AppColor.bgContainerColor
                                                    .withOpacity(.5),
                                          ),
                                          const SizedBox(height: 10),
                                          BigText(
                                            text: index == 0
                                                ? "Supplement"
                                                : "Clothes",
                                            fontSize: 15,
                                            color: isChoose == index
                                                ? AppColor.primaryTextColor
                                                : AppColor.textColor
                                                    .withOpacity(.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                orderSystem();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: BigText(
                              text: "Order System",
                              color: AppColor.textColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(
                              text: "You already have account?",
                              color: AppColor.textColor,
                              fontSize: 16,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(LoginScreen.routeName);
                              },
                              child: const BigText(
                                text: "Log in",
                                color: AppColor.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
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
