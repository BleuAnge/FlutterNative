import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterLayout extends StatefulWidget {
  final Widget child;
  const RouterLayout({
    required this.child,
    super.key
  });

  @override
  State<RouterLayout> createState() => _RouterLayoutState();
}

class _RouterLayoutState extends State<RouterLayout> {
  final List<({
    String title,
    IconData icon, 
  })> navigationItems = [
    (title: 'Home', icon: Icons.home),
    (title: 'About', icon: Icons.question_answer),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Native Test App'),
    ),
    body: widget.child,
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        context.goNamed(
          "${navigationItems[index].title}Page"
        );

        setState(() {
          selectedIndex = index;
        });
      },
      items: navigationItems.map((item) => BottomNavigationBarItem(
        icon: Icon(item.icon),
        label: item.title
      )).toList(),
    ),
  );
}