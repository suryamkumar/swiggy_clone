import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final String imagePath;

  const OfferCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.12), color.withOpacity(0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            // Text section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: color.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            // Image
            Image.asset(imagePath,
              width: 60,
              height: 55,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
