import 'package:flutter/material.dart';
import 'package:native_test/pages/home/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_test/pages/home/ui/state/initial.dart';
import 'package:native_test/pages/home/ui/state/loaded.dart';
import 'package:native_test/pages/home/ui/state/loading.dart';

class HomeLogic extends StatefulWidget {
  const HomeLogic({super.key});

  @override
  State<HomeLogic> createState() => _HomeLogicState();
}

class _HomeLogicState extends State<HomeLogic> {
  @override
  Widget build(BuildContext context) => BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) => switch (state) {
      HomeInitial() => const InitialPage(),

      HomeLoading() => const LoadingPage(),

      HomeLoaded() => LoadedPage(
        username: state.username,
        books: state.books,
      )
    },
  );
}