// ignore_for_file: non_constant_identifier_names

import 'package:bag/Feature/Home/presentation/View/ProfileView.dart';
import 'package:bag/Feature/Home/presentation/View/StoreView.dart';
import 'package:bag/Feature/Home/presentation/View/WishListView.dart';
import 'package:bag/Feature/Home/presentation/View/widgets/HomeViewBody.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Widget> NavBarScreans = [
    HomeViewBody(),
    StoreView(),
    WishListView(),
    ProfileView()
  ];

  int currentIndex = 0;

  void ChangeBottomIndex(int index) {
    currentIndex = index;
    emit(HomeChangeBottomIndex());
  }
}