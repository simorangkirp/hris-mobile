import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../lib.dart';
import '../widgets/home.skeleton.dart';

@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: this,
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController sCtrl = ScrollController();
  EntityProfile? model;

  void dispatchGetProfileList() {
    BlocProvider.of<HomeBloc>(context).add(GetProfileInfo());
  }

  @override
  void initState() {
    super.initState();
    dispatchGetProfileList();
  }

  buildHome(EntityProfile? mods) {
    return Scaffold(
      appBar: buildAppBar(mods),
      endDrawer: const AppNavigationDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overScrl) {
                  overScrl.disallowIndicator();
                  return false;
                },
                child: SingleChildScrollView(
                  controller: sCtrl,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12.h),
                        faturesComponent(),
                        Divider(
                          color: appBgBlack.withOpacity(0.3),
                          height: 32.h,
                        ),
                        const HomePengumumanWidget(),
                        Divider(
                          color: appBgBlack.withOpacity(0.3),
                          height: 32.h,
                        ),
                        const HomeTaskWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ProfileDataLoaded) {
          model = state.profile;
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          // return const HomeScreenSkeleton();
          if (state is HomeLoading) {
            return const HomeScreenSkeleton();
          } else {
            return buildHome(model);
          }
        },
      ),
    );
  }
}
