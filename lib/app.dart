import 'package:bag/Core/Uitls/Resourses/ThemManger.dart';
import 'package:bag/Core/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

class BgaStore extends StatelessWidget {
  const BgaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: getAppThem(),
    );
  }
}
