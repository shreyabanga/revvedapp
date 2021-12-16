import 'package:flutter/material.dart';

const purpleColor = Color(0xFF5c25f5);

BoxDecoration cardDecoration(int index) {
    return BoxDecoration(
      // change the color of first card which represents the current date
        color: index == 0 ? Colors.white : purpleColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: purpleColor.withOpacity(0.3),
              offset: const Offset(10, 10),
              blurRadius: 20),
          BoxShadow(
              color: Colors.white.withOpacity(0.8),
              offset: const Offset(-5, -5),
              blurRadius: 20),
        ]);
  }

TextStyle viewsStyle(int index) {
    return TextStyle(
                          fontSize: 30.0,
                          color: index == 0 ? purpleColor : Colors.white,
                          fontWeight: FontWeight.bold);
  }

TextStyle dateStyle(int index) {
    return TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                  color: index == 0 ? purpleColor : Colors.white,
                );
  }

TextStyle articleNameStyle() {
    return const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: purpleColor);
  }
