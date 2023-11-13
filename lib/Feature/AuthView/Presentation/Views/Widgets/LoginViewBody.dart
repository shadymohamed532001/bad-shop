// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:bag/Core/Uitls/Resourses/ColorMangager.dart';
import 'package:bag/Core/Uitls/LocalServices.dart';
import 'package:bag/Core/Uitls/functions.dart';
import 'package:bag/Core/Widgets/CustomBottom.dart';
import 'package:bag/Feature/AuthView/Presentation/Views/Widgets/CustomAuthTextFormField.dart';
import 'package:bag/Feature/AuthView/Presentation/Views/Widgets/ShowsToustColor.dart';
import 'package:bag/Feature/AuthView/Presentation/manager/Cubites/LoginCubite/cubit/login_cubit.dart';
import 'package:bag/Feature/Home/presentation/View/HomeView.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        if (state is LoginLoading) {
          // show the CircularProgressIndicator widget
          showDialog(
              context: context,
              builder: (_) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.whiteColor,
                    ),
                  ));
        } else if (state is LoginSucess) {
          if (state.bagLoginModel.status == true) {
            Navigator.of(context)
                .pop(); // close the dialog if successfully logged in
            ShowTouster(
              massage: state.bagLoginModel.message!,
              state: ToustState.SUCCESS,
            );
            LocalServices.saveData(
                    key: 'token', value: state.bagLoginModel.data!.token)
                .then((value) {
              PushAndFinsh(context, PageName: HomeView.routeName);
            });
          } else {
            Navigator.of(context).pop(); // close the dialog if login fails
            ShowTouster(
              massage: state.bagLoginModel.message!,
              state: ToustState.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        var Loginubite = BlocProvider.of<LoginCubit>(context);
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                        child: Text(
                          errorMessage,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorManger.redColor,
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
                        obscureText: Loginubite.isPasswordShow,
                        suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<LoginCubit>(context)
                                .ChangepasswordVisiability();
                          },
                          icon: Loginubite.icon,
                        ),
                        hintText: 'Min 6 Cyfr',
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
                              .copyWith(color: ColorManger.primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                      CustomBottom(
                        bottomtext: 'Sign in',
                        onPressed: () {
                          if (formKey.currentState!.validate() == true) {
                            LoginUser(context);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        backgroundColor: ColorManger.primaryColor,
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
                              onPressed: () {},
                              child: Text(
                                'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: ColorManger.primaryColor,
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
        );
      },
    );
  }

  void LoginUser(BuildContext context) {
    BlocProvider.of<LoginCubit>(context).LoginUser(
      Email: emailController.text,
      password: passwordController.text,
      lang: 'en',
    );
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
