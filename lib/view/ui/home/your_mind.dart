import 'package:flutter/material.dart';

class YourMind extends StatelessWidget {
  const YourMind({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "SURYAM, WHAT'S ON YOUR MIND?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Divider(thickness: 1, color: Colors.black26),
                ),
              ],
            ),
          ),
          CategoryScrollTwoRows(),
        ],
      ),
    );
  }
}

class CategoryScrollTwoRows extends StatelessWidget {
  const CategoryScrollTwoRows({super.key});

  final List<String> categoryNames = const [
    "Biryani",
    "Burger",
    "Cakes",
    "Pizza",
    "Rolls",
    "Chinese",
    "Ice Cream",
    "Fries",
    "Juice",
    "South Indian",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: IntrinsicHeight( // Optional: Helps fit the height dynamically
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              (categoryNames.length / 2).ceil(),
                  (index) {
                final firstItem = categoryNames[index];
                final secondIndex = index + (categoryNames.length / 2).ceil();
                final secondItem = secondIndex < categoryNames.length
                    ? categoryNames[secondIndex]
                    : null;

                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      _buildCategoryItem(firstItem),
                      const SizedBox(height: 12),
                      if (secondItem != null) _buildCategoryItem(secondItem),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: const AssetImage("assets/left.png"),
          backgroundColor: Colors.grey.shade200,
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 72,
          child: Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
