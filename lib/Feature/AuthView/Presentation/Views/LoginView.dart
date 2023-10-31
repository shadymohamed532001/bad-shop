import 'package:bag/Feature/AuthView/Presentation/Views/Widgets/LoginViewBody.dart';
import 'package:bag/Feature/AuthView/Presentation/manager/Cubites/LoginCubite/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'loginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginViewBody(),
      ),
    );
  }
}
