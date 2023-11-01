// ignore_for_file: non_constant_identifier_names

import 'package:bag/Core/Uitls/ApiServices.dart';
import 'package:bag/Core/Uitls/endBoint.dart';
import 'package:bag/Feature/AuthView/Presentation/ViewModels/bag_login_model/bag_Auth_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  BagAuthModel? bagAuthModel;

  void RegisterUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoading());
    await ApiServices.PostData(
      endpoint: RegisterendPoint,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      bagAuthModel = BagAuthModel.fromJson(value.data);
      emit(RegisterSucess(bagAuthModel: bagAuthModel!));
    }).catchError((error) {
      print(error.toString());
    });
  }

  bool isPasswordShow = true;

  Widget icon = const Icon(Icons.visibility_off);
  void ChangepasswordVisiability() {
    isPasswordShow = !isPasswordShow;

    icon = isPasswordShow
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);

    emit(RegisterChangePasswordVisiablity());
  }
}
