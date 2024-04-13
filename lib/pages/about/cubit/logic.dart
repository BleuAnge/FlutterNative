import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_test/pages/about/cubit/cubit.dart';
import 'package:native_test/pages/about/ui/state/initial.dart';
import 'package:native_test/pages/about/ui/state/loaded.dart';
import 'package:native_test/pages/about/ui/state/loading.dart';

class AboutLogic extends StatefulWidget {
  const AboutLogic({super.key});

  @override
  State<AboutLogic> createState() => _AboutLogicState();
}

class _AboutLogicState extends State<AboutLogic> {
  @override
  void initState() {
    context.read<AboutCubit>().Init();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) => BlocBuilder<AboutCubit, AboutState>(
    builder: (context, state) => switch (state) {
      AboutInitial() => const InitialPage(),
      AboutLoading() => const LoadingPage(),
      AboutLoaded() => const LoadedPage(),
    }
  );
}