import 'package:flutter/material.dart';

import '../utils/styles.dart';
import '../pages/home.dart';
import '../pages/mindful.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const AppBottomNavigationBar({Key? key, this.currentIndex = 0, this.onTap}) : super(key: key);

  void _navigate(BuildContext context, int index) {
    if (onTap != null) {
      onTap!(index);
      return;
    }

    Widget destination;
    switch (index) {
      case 0:
        destination = const HomeScreen();
        break;
      case 3:
        destination = const MindfulScreen();
        break;
      default:
        // For pages not implemented yet, navigate to Home as fallback
        destination = const HomeScreen();
    }

    // avoid navigating to same page
    if (index == currentIndex) return;

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => destination));
  }

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = kPrimaryButtonGradient.colors.first;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (i) => _navigate(context, i),
      selectedItemColor: selectedColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "Journal"),
        BottomNavigationBarItem(icon: Icon(Icons.videogame_asset), label: "Games"),
        BottomNavigationBarItem(icon: Icon(Icons.self_improvement), label: "Mindful"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
