import 'package:flutter/material.dart';
import 'offer_card.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Row(
            children: const [
              Text(
                "BEST OFFERS FOR YOU",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ),

        // Offer cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              OfferCard(
                title: 'MIN ₹100 OFF',
                subtitle: 'Flat Deals',
                color: Colors.pinkAccent,
                imagePath: "assets/offer_one.png",
              ),
              OfferCard(
                title: 'ALL OFFER',
                subtitle: '60% off and more',
                color: Colors.green,
                imagePath: "assets/offer_two.png",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
