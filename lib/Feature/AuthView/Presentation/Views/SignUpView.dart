import 'package:bag/Feature/AuthView/Presentation/Views/Widgets/SignUpViewBody.dart';
import 'package:bag/Feature/AuthView/Presentation/manager/Cubites/RegisterCubite/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = 'SignUpView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: SignUpViewBody(),
      ),
    );
  }
}
