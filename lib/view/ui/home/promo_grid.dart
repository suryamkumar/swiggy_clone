import 'package:flutter/material.dart';
import 'package:food/utils/color.dart';

class PromoGrid extends StatelessWidget {
  const PromoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_PromoItem> items = const [
      _PromoItem(
        title: "Food In\n10 Mins",
        imagePath: "assets/bolt.png",
      ),
      _PromoItem(
        title: "Flat ₹200\nOFF",
        imagePath: "assets/right.png",
      ),
      _PromoItem(
        title: "Order Big\nBites",
        imagePath: "assets/order_big.png",
      ),
    ];

    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff0f054b), Color(0xff1a103d)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24)
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xff151b54),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.shade100, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 1,
                          horizontal: 4,
                        ),
                        child:Row(children: [
                        const Icon(Icons.arrow_forward_ios, size: 10),
                      ],),),
                      Image.asset(item.imagePath, height: 28),
                    ],
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _PromoItem {
  final String title;
  final String imagePath;

  const _PromoItem({
    required this.title,
    required this.imagePath,
  });
}
