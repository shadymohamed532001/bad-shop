import 'package:bag/Core/Uitls/api_services.dart';
import 'package:bag/Core/Uitls/LocalServices.dart';
import 'package:bag/Core/Uitls/blocObserver.dart';

import 'package:bag/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  ApiServices.init();
  await LocalServices.Init();

  runApp(BgaStore());
}
