import 'package:bag/Core/Uitls/Resourses/ColorMangager.dart';
import 'package:bag/Core/Uitls/Resourses/ImageAssets.dart';
import 'package:bag/Feature/AuthView/Presentation/Views/Widgets/LoginViewBody.dart';
import 'package:bag/Feature/AuthView/Presentation/Views/Widgets/SignUpViewBody.dart';
import 'package:bag/Feature/AuthView/Presentation/manager/Cubites/LoginCubite/cubit/login_cubit.dart';
import 'package:bag/Feature/AuthView/Presentation/manager/Cubites/RegisterCubite/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthViewBody extends StatefulWidget {
  static const String routeName = 'AuthViewBody';

  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<AuthViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Image.asset(
              ImagesAssetsManger.applogoBlack,
              width: 50,
              height: 50,
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  tabs: [
                    Text(
                      'SIGN IN',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 14),
                    ),
                    Text(
                      'SIGN UP',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 14),
                    ),
                  ],
                  indicatorWeight: 4,
                  indicatorColor: ColorManger.primaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      const LoginViewBody(),
                      SignUpViewBody(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
