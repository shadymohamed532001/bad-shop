import 'dart:async';

import 'package:bag/Core/Uitls/AppRoutes.dart';
import 'package:bag/Core/Uitls/Constants.dart';
import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:bag/Core/Uitls/assets.dart';
import 'package:bag/Feature/AuthView/Presentation/Views/Widgets/CustomTextFormField.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  bool isPasswordShow = true;

  String errorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      child: SizedBox(
                        height: 16,
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
                        if (text.length < 8) {
                          return 'Password 8 chars at least';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.4, //
                          child: Checkbox(
                            value: widget.isChecked,
                            activeColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                    width: 1,
                                    color: MyTheme.primaryColor,
                                    style: BorderStyle.none)),
                            onChanged: (bool? newValue) {
                              setState(() {
                                widget.isChecked = newValue!;
                              });
                            },
                          ),
                        ),
                        Text('I agree with Terms and ',
                            style: Theme.of(context).textTheme.titleSmall),
                        Text('Privacy Policy',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: MyTheme.primaryColor,
                                    decoration: TextDecoration.underline)),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        register();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          backgroundColor: MyTheme.primaryColor,
                          shape: StadiumBorder(
                              side: BorderSide(color: MyTheme.primaryColor))),
                      child: Text('Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: MyTheme.whiteColor)),
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
                              GoRouter.of(context)
                                  .pushReplacement(AppRouter.KbookonBording);
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
  }

  void NavigationToSignIn(BuildContext context) {
    Timer(const Duration(milliseconds: 200), () {
      GoRouter.of(context).pushReplacement(AppRouter.KLoginView);
    });
  }

  void register() async {
    if (formKey.currentState!.validate() == true) {
      //   // todo: show loading
      //   DialogUtils.showLoading(context, AppLocalizations.of(context)!.loading);
      //   // await Future.delayed(Duration(seconds: 2));
      //   try {
      //     final credential = await FirebaseAuth.instance
      //         .createUserWithEmailAndPassword(
      //         email: emailController.text, password: passwordController.text);
      //
      //     MyUser myUser = MyUser(
      //         id: credential.user?.uid ?? '',
      //         name: nameController.text,
      //         email: emailController.text);
      //     var authProvider = Provider.of<AuthProvider>(context, listen: false);
      //     authProvider.updateUser(myUser);
      //     await FirebaseUtils.addUserToFireStore(myUser);
      //     // todo: hide loading
      //     // todo: show message
      //     DialogUtils.hideLoading(context);
      //     DialogUtils.showMessage(
      //         context, AppLocalizations.of(context)!.register_message_success,
      //         title: AppLocalizations.of(context)!.success_title,
      //         posActionName: AppLocalizations.of(context)!.ok,
      //         barrierDismissible: false, posAction: () {
      //       Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      //     });
      //   } on FirebaseAuthException catch (e) {
      //     if (e.code == 'weak-password') {
      //       // todo: hide loading
      //       // todo: show message
      //       DialogUtils.hideLoading(context);
      //       DialogUtils.showMessage(context, 'The password provided is too weak',
      //           title: AppLocalizations.of(context)!.error_title,
      //           posActionName: AppLocalizations.of(context)!.ok);
      //
      //       print('The password provided is too weak.');
      //     } else if (e.code == 'email-already-in-use') {
      //       // todo: hide loading
      //       // todo: show message
      //       DialogUtils.hideLoading(context);
      //       DialogUtils.showMessage(context,
      //           AppLocalizations.of(context)!.register_message_email_exist,
      //           title: AppLocalizations.of(context)!.error_title,
      //           posActionName: AppLocalizations.of(context)!.ok,
      //           barrierDismissible: false);
      //     }
      //   } catch (e) {
      //     // todo: hide loading
      //     // todo: show message
      //     DialogUtils.hideLoading(context);
      //     DialogUtils.showMessage(context, e.toString(),
      //         title: AppLocalizations.of(context)!.error_title,
      //         posActionName: AppLocalizations.of(context)!.ok);
      //
      //     print(e);
      //   }
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
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
