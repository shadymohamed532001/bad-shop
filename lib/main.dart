import 'package:bag/Core/Uitls/api_services.dart';
import 'package:bag/Core/Uitls/local_services.dart';
import 'package:bag/Core/Uitls/blocObserver.dart';
import 'package:bag/Core/Uitls/functions.dart';
import 'package:bag/Core/Uitls/service_locator.dart';
import 'package:bag/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  await LocalServices.init();
  fetchDataFromLocalStorage();
  ApiServices.init();
  runApp(BgaStore());
}
