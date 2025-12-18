import 'package:flutter/material.dart';

// Shared app styles
const LinearGradient kPrimaryButtonGradient = LinearGradient(
  colors: [Color(0xFFF48C91), Color(0xFF8E2DE2)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const LinearGradient kHeaderGradient = LinearGradient(
  colors: [Color(0xFFF48C91), Color(0xFF8E2DE2),Color(0xFFE0C3FC)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const Color kCardShadowColor = Color.fromRGBO(0, 0, 0, 0.1);
const Color kTextGrey = Color(0xFF757575);
const Color kFillGrey = Color(0xFFF5F5F5);
const Color kDividerGrey = Color(0xFFBDBDBD);
const Color kIconGrey = Color(0xFF9E9E9E);
const Color kBlueAccentColor = Colors.blueAccent;
const Color kButtonTextColor = Colors.white;

// Additional colors used across auth pages
// Updated: make the app background match Home's soft cream (0xFFF8F3)
const Color kBackgroundColor = Color(0xFFFFF8F3);
const Color kCardBackgroundColor = Colors.white;
const Color kCheckboxActiveColor = Colors.purple;
const Color kTransparentColor = Colors.transparent;
const Color kGoogleTextColor = Color(0xFF212121);

// Shared layout constants
const double kCardTopMargin = 150.0;
