import 'package:bag/Core/Uitls/ApiServices.dart';
import 'package:bag/Core/Uitls/AppRoutes.dart';
import 'package:bag/Core/Uitls/LocalServices.dart';
import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:bag/Core/Uitls/blocObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  ApiServices.init();
  LocalServices.Init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
