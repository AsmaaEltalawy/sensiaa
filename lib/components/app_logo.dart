import 'package:flutter/material.dart';

/// Reusable app logo widget used across the app.
/// By default it renders a circular orange background with a white icon.
class AppLogo extends StatelessWidget {
  final IconData icon;
  final double padding;
  final double iconSize;
  final Color bgColor;
  final VoidCallback? onTap;

  const AppLogo({
    Key? key,
    this.icon = Icons.nightlight_round,
    this.padding = 10,
    this.iconSize = 20,
    this.bgColor = Colors.orange,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logo = Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
      ),
      child: Icon(icon, color: Colors.white, size: iconSize),
    );

    if (onTap == null) return logo;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: logo,
    );
  }
}

