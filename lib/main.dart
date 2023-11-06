// ignore_for_file: library_private_types_in_public_api

import 'package:bag/Core/Uitls/ApiServices.dart';
import 'package:bag/Core/Uitls/Constants.dart';
import 'package:bag/Core/Uitls/LocalServices.dart';
import 'package:bag/Core/Uitls/MyTheme.dart';
import 'package:bag/Core/Uitls/blocObserver.dart';

import 'package:bag/Feature/Home/presentation/View/HomeView.dart';
import 'package:bag/Feature/Home/presentation/View/Manager/Cubites/HomeCubite/cubit/home_cubit.dart';
import 'package:bag/Feature/OnBordingView/Presentation/Views/OnBordingView.dart';
import 'package:bag/Feature/AuthView/Presentation/Views/AuthViewBody.dart';
import 'package:bag/Feature/SplashView/Presntation/Views/SplashView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  ApiServices.init();
  await LocalServices.Init();

  OnBording = LocalServices.getData(key: 'onbording');
  token = LocalServices.getData(key: 'token');

  Widget widgetInit;

  if (OnBording != null) {
    if (token != null) {
      widgetInit = const HomeView();
    } else {
      widgetInit = AuthViewBody();
    }
  } else {
    widgetInit = const OnBordingView();
  }

  runApp(MyApp(initialWidget: widgetInit));
}

class MyApp extends StatefulWidget {
  final Widget initialWidget;

  const MyApp({Key? key, required this.initialWidget}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Simulate a loading process
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..HomeGetData(),
      child: MaterialApp(
        routes: {
          HomeView.routeName: (context) => const HomeView(),
          AuthViewBody.routeName: (context) => AuthViewBody(),
          OnBordingView.routeName: (context) => const OnBordingView(),
        },
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme,
        home: isLoading ? const SplashView() : widget.initialWidget,
      ),
    );
  }
}
