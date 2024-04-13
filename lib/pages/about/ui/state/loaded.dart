import 'package:flutter/material.dart';

class LoadedPage extends StatelessWidget {
  const LoadedPage({super.key});

  @override
  Widget build(BuildContext context) => const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('This App is to Demonstrate how to'),
        Text('Implement Native Code in Flutter'),
      ],
    )
  );
}