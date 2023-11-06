// ignore_for_file: non_constant_identifier_names

import 'package:bag/Core/Uitls/ApiServices.dart';
import 'package:bag/Core/Uitls/Constants.dart';
import 'package:bag/Core/Uitls/endBoint.dart';
import 'package:bag/Feature/Home/presentation/View/ProfileView.dart';
import 'package:bag/Feature/Home/presentation/View/StoreView.dart';
import 'package:bag/Feature/Home/presentation/View/WishListView.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/HomeViewBody.dart';
import 'package:bag/Feature/Home/presentation/ViewModels/HomeModel/home_model/home_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Widget> NavBarScreans = [
    const HomeViewBody(),
    const StoreView(),
    const WishListView(),
    const ProfileView()
  ];

  int currentIndex = 0;

  void ChangeBottomIndex(int index) {
    currentIndex = index;
    emit(HomeChangeBottomIndex());
  }

  HomeModel? homeModel;
  Future HomeGetData() async {
    try {
      emit(HomeLoading());
      var responses =
          await ApiServices.GetData(endpoint: homeendPoint, token: token);

      homeModel = HomeModel.fromJson(responses.data);
      emit(HomeSucess(homeModel: homeModel!));

      return homeModel;
    } catch (e) {
      emit(HomeError(error: e.toString()));
    }
  }

  // Future HomeGetData() async {
  //   emit(HomeLoading());

  //   await ApiServices.GetData(endpoint: homeendPoint, token: token).then(
  //     (value) {
  //       homeModel = HomeModel.fromJson(value.data);
  //       print(homeModel!.data!.banners![0].image);

  //       emit(HomeSucess(homeModel: homeModel!));
  //     },
  //   ).catchError((error) {
  //     emit(HomeError(error: error.toString()));
  //   });
  // }
}
