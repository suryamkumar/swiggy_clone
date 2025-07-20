import 'package:flutter/material.dart';

class LottieTiles extends StatelessWidget {
  const LottieTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFDD4A00), // Matches top of this widget
                Color(0xFFCC3B00),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/app_banner-removed.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}
