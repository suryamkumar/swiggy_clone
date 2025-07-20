import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/color.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader({super.key});

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  final List<String> hints = ["Biryani", "Food", "Dosa", "Idli", "Paneer"];
  int _currentHintIndex = 0;
  late Timer _hintTimer;

  @override
  void initState() {
    super.initState();
    _hintTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentHintIndex = (_currentHintIndex + 1) % hints.length;
      });
    });
  }

  @override
  void dispose() {
    _hintTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff0f054b), Color(0xff1a103d)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row (address + icons)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Address section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.home, color: AppColors.white, size: 16),
                      const SizedBox(width: 4),
                      const Text(
                        'HOME',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SvgPicture.asset(
                        'assets/svg/ChevronDown.svg',
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  Text(
                    '102, Raycon Orchard, A Block, 87, 4th cro...',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),

              // Right icons
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: AppColors.secondary,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondary.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/buyone.png',
                      height: 36,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Search box
          TextField(
            decoration: InputDecoration(
              hintText: "Search for '${hints[_currentHintIndex]}'",
              hintStyle: const TextStyle(fontSize: 14),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.grey.shade400,
                    ),
                    const Icon(Icons.mic, color: AppColors.primary),
                  ],
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 8,),
          // Promo Banner Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/left.png', height: 60), // Adjust height if needed

              Column(
                children: [
                  const Text(
                    'Flat ₹200 OFF on delights',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: const Text('ORDER NOW',
                      style: TextStyle(
                        color: Colors.transparent,
                        shadows: [Shadow(offset: Offset(0, -1), color: Colors.black)],
                        decorationColor: Colors.black,
                        fontWeight: FontWeight.w500,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset('assets/right.png', height: 60), // Adjust height if needed
            ],
          ),
        ],
      ),
    );
  }
}
