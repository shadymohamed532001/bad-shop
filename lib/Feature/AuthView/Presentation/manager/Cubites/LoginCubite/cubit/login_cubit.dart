// ignore_for_file: non_constant_identifier_names

import 'package:bag/Core/Uitls/ApiServices.dart';
import 'package:bag/Core/Uitls/endBoint.dart';
import 'package:bag/Feature/AuthView/Presentation/ViewModels/Bag_Auth_Model/bag_Auth_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  BagAuthModel? bagLoginModel;

  void LoginUser({
    String? lang,
    required String Email,
    required String password,
  }) async {
    emit(LoginLoading());
    await ApiServices.PostData(
        lang: lang ?? 'en',
        endpoint: Loginendpoint,
        data: {
          'email': Email,
          'password': password,
        }).then((value) {
      bagLoginModel = BagAuthModel.fromJson(value.data);
      emit(LoginSucess(bagLoginModel: bagLoginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErorr(error: error.toString()));
    });
  }

  bool isPasswordShow = true;
  Widget icon = const Icon(Icons.visibility_off);
  void ChangepasswordVisiability() {
    isPasswordShow = !isPasswordShow;

    icon = isPasswordShow
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);

    emit(LoginChangePasswordVisiablity());
  }
}
