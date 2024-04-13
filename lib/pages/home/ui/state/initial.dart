import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_test/pages/home/cubit/cubit.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) => 
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [
          MaterialButton(
            onPressed: () {
              context.read<HomeCubit>().invokeToast();
            },
            color: Colors.blueAccent,
            textColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            child: const Text("Show Toast"),
          ),
          const SizedBox(
            height: 8,
          ),
          MaterialButton(
            onPressed: () {
              context.read<HomeCubit>().fetchVariable();
            },
            color: Colors.blueAccent,
            textColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            child: const Text("Fetch Variable"),
          ),
        ],
      )
    );
}