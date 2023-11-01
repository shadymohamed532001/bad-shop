// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:bag/Core/Uitls/Constants.dart';
import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:bag/Core/Uitls/assets.dart';
import 'package:bag/Core/Uitls/functions.dart';
import 'package:bag/Core/Widgets/CustomBottom.dart';
import 'package:bag/Feature/AuthView/Presentation/Views/LoginView.dart';
import 'package:bag/Feature/AuthView/Presentation/Views/Widgets/CustomTextFormField.dart';
import 'package:bag/Feature/AuthView/Presentation/manager/Cubites/RegisterCubite/cubit/register_cubit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignUpViewBody extends StatefulWidget {
  static const String routeName = 'register';
  bool isChecked = false;

  SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  var formKey = GlobalKey<FormState>();

  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  String errorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset(
              AppAssets.applogoBlack,
              height: 50,
              width: 50,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedButtonIndex = 0;
                              });
                              NavigationToSignIn(context);
                            },
                            child: Text(
                              'SIGN IN',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            onPressed: () async {
                              setState(() {
                                selectedButtonIndex = 1;
                              });
                            },
                            child: Text(
                              'SIGN UP',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 122,
                          top: 35,
                        ),
                        child: Align(
                          widthFactor: 2.6,
                          alignment: selectedButtonIndex == 1
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                          child: Container(
                            height: 3.3,
                            width: MediaQuery.of(context).size.width * .136,
                            decoration: BoxDecoration(
                              color: MyTheme.primaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    'SIGN UP',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Form(
                    key: formKey,
                    autovalidateMode: autovalidateMode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text('Full Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 15)),
                        ),
                        CustomTextFormFiled(
                          obscureText: false,
                          hintText: 'Name',
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text('Email',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 15)),
                        ),
                        CustomTextFormFiled(
                          onChanged: (value) {
                            validateEmail(value);
                          },
                          obscureText: false,
                          hintText: 'Patient@self.com',
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 26),
                          child: Text(
                            errorMessage,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: MyTheme.RedColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text('Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 15)),
                        ),
                        CustomTextFormFiled(
                          obscureText: BlocProvider.of<RegisterCubit>(context)
                              .isPasswordShow,
                          suffixIcon: IconButton(
                            onPressed: () {
                              BlocProvider.of<RegisterCubit>(context)
                                  .ChangepasswordVisiability();
                            },
                            icon: BlocProvider.of<RegisterCubit>(context).icon,
                          ),
                          hintText: 'Min 8 Cyfr',
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter your password';
                            }
                            if (text.length < 8) {
                              return 'Password 8 chars at least';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text('phone',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 15)),
                        ),
                        CustomTextFormFiled(
                          obscureText: false,
                          hintText: 'phone',
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter your phone';
                            }
                            return null;
                          },
                        ),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.36,
                              child: Checkbox(
                                value: widget.isChecked,
                                activeColor: MyTheme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                      color: MyTheme.primaryColor,
                                      style: BorderStyle.none,
                                    )),
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    widget.isChecked = newValue!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'I agree with Terms and ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Privacy Policy',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: MyTheme.primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        CustomBottom(
                          bottomtext: 'Sign Up',
                          onPressed: () {
                            if (formKey.currentState!.validate() &&
                                widget.isChecked == true) {
                              RegisterUser(context);
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                          backgroundColor: MyTheme.primaryColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have account?',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            TextButton(
                                onPressed: () {
                                  PushAndFinsh(context,
                                      PageName: LoginView.routeName);
                                  setState(() {
                                    setState(() {
                                      selectedButtonIndex = 0;
                                    });
                                  });
                                },
                                child: Text(
                                  'Sign In',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: MyTheme.primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void RegisterUser(BuildContext context) {
    BlocProvider.of<RegisterCubit>(context).RegisterUser(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        phone: phoneController.text);
    print('register sucssefuly');
  }

  void NavigationToSignIn(BuildContext context) {
    Timer(const Duration(milliseconds: 120), () {
      PushAndFinsh(context, PageName: LoginView.routeName);
    });
  }

  void validateEmail(String val) {
    if (!EmailValidator.validate(val, true) && val.isNotEmpty) {
      setState(() {
        errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        errorMessage = "";
      });
    }
  }
}
