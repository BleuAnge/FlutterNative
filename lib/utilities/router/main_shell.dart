import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:native_test/pages/about/cubit/cubit.dart';
import 'package:native_test/pages/about/cubit/logic.dart';
import 'package:native_test/pages/home/cubit/cubit.dart';
import 'package:native_test/pages/home/cubit/logic.dart';
import 'package:native_test/utilities/router/main.dart';

final GlobalKey<NavigatorState> _mainkey = GlobalKey<NavigatorState>();

final ShellRoute mainShellRoute = ShellRoute(
  navigatorKey: _mainkey,
  builder: (context, state, child) => 
    RouterLayout(child: child),
  routes: [
    GoRoute(
      name: "HomePage",
      path: '/home',
      builder: (context, state) => BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(),
        child: const HomeLogic(),
      ),
    ),
    GoRoute(
      name: "AboutPage",
      path: '/about',
      builder: (context, state) => BlocProvider<AboutCubit>(
        create: (context) => AboutCubit(),
        child: const AboutLogic(),
      ),
    ),
  ],
);