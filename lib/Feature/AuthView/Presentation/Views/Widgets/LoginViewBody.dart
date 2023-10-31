// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:bag/Core/Uitls/AppRoutes.dart';
import 'package:bag/Core/Uitls/Constants.dart';
import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:bag/Core/Uitls/assets.dart';
import 'package:bag/Feature/AuthView/Presentation/Views/Widgets/CustomTextFormField.dart';
import 'package:bag/Feature/AuthView/Presentation/manager/Cubites/LoginCubite/cubit/login_cubit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  bool isPasswordShow = true;
  String errorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSucess) {
          if (state.bagLoginModel.status == true) {
            Fluttertoast.showToast(
              msg: '${state.bagLoginModel.message}',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 4,
              backgroundColor: MyTheme.primaryColor,
              textColor: MyTheme.whiteColor,
              fontSize: 16.0,
            );
          } else {
            Fluttertoast.showToast(
                msg: '${state.bagLoginModel.message}',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP_RIGHT,
                timeInSecForIosWeb: 4,
                backgroundColor: MyTheme.RedColor,
                textColor: MyTheme.whiteColor,
                fontSize: 16.0);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Image.asset(
              AppAssets.applogoBlack,
              width: 50,
              height: 50,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
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
                              NavigationToSignUP(context);
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
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.285,
                          top: MediaQuery.of(context).size.width * 0.08,
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
                    'SIGN IN',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Form(
                    key: formKey,
                    autovalidateMode: autovalidateMode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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
                          child: SizedBox(
                            height: 15,
                            width: double.infinity,
                            child: Text(
                              errorMessage,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 199, 47, 36),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
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
                          obscureText: isPasswordShow,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordShow = !isPasswordShow;
                              });
                            },
                            icon: isPasswordShow
                                ? const Icon((Icons.visibility_off))
                                : const Icon(Icons.visibility),
                          ),
                          hintText: 'Min 8 Cyfr',
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter your password';
                            }
                            if (text.length < 6) {
                              return 'Password 8 chars at least';
                            }
                            return null;
                          },
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.of(context)
                            // .pushNamed(ForgetPassword.routeName);
                          },
                          child: Text(
                            textAlign: TextAlign.right,
                            'Forgot your password?',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: MyTheme.primaryColor),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                        ),
                        CustomBottom(
                          bottomtext: 'Sign in',
                          onPressed: () {
                            if (formKey.currentState!.validate() == true) {
                              BlocProvider.of<LoginCubit>(context).LoginUser(
                                Email: emailController.text,
                                password: passwordController.text,
                                lang: 'en',
                              );
                              print('Login Sucessfuly');
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
                              'Don’t have an account?',
                              // AppLocalizations.of(context)!.do_not_have_an_account,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButtonIndex = 1;
                                  });
                                  GoRouter.of(context)
                                      .pushReplacement(AppRouter.KSignUpView);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: MyTheme.primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                ))
                          ],
                        ),
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

  void NavigationToSignUP(BuildContext context) {
    Timer(const Duration(milliseconds: 200), () {
      GoRouter.of(context).push(AppRouter.KSignUpView);
    });
  }

  void validateEmail(String val) {
    if (!EmailValidator.validate(val, true) && val.isNotEmpty) {
      setState(() {
        errorMessage = "Please enter valid Email Address";
      });
    } else {
      setState(() {
        errorMessage = "";
      });
    }
  }
}

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    required this.bottomtext,
  });

  final void Function() onPressed;
  final Color? backgroundColor;
  final String bottomtext;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          backgroundColor: backgroundColor,
          shape: StadiumBorder(side: BorderSide(color: MyTheme.primaryColor))),
      child: Text(bottomtext,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: MyTheme.whiteColor)),
    );
  }
}
