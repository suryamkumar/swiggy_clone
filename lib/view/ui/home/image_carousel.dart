import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food/utils/color.dart';
import '../../shimmer/home/shimmer_carousel_slider.dart';

class AssetImageCarousel extends StatefulWidget {
  final List<String> imagePaths;

  const AssetImageCarousel({super.key, required this.imagePaths});

  @override
  State<AssetImageCarousel> createState() => _AssetImageCarouselState();
}

class _AssetImageCarouselState extends State<AssetImageCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.imagePaths.isEmpty) {
      return const ShimmerCarouselSlider(); // Show shimmer while loading
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 150.0,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1.3,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: widget.imagePaths.map((path) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Image.asset(
                        path,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imagePaths.asMap().entries.map((entry) {
            bool isActive = _current == entry.key;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              width: isActive ? 8.0 : 6.0,
              height: isActive ? 8.0 : 6.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? AppColors.primary : Colors.grey.shade400,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
