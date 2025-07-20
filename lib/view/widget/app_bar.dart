import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHomeAppBar extends StatefulWidget {
  final List<String> hints;
  final int currentHintIndex;

  const CustomHomeAppBar({
    super.key,
    required this.hints,
    required this.currentHintIndex,
  });

  @override
  State<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends State<CustomHomeAppBar> {
  bool _isScrolled = false;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: 130,
      elevation: _isScrolled ? 0 : 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: false,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Corrected logic: true when collapsed
          final bool isScrolled = constraints.biggest.height < 130;
          if (isScrolled != _isScrolled) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                _isScrolled = isScrolled;
              });
            });
          }

          return Stack(
            children: [
              if (!_isScrolled)
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFB74D),
                        Color(0xFFE65100),
                        Color(0xFFDD4A00),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

              Positioned(
                left: 16,
                top: MediaQuery.of(context).padding.top + 10,
                right: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.home,
                            color: _isScrolled ? AppColors.primary : AppColors.background,
                            size: 20),
                        const SizedBox(width: 6),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset(
                          'assets/svg/ChevronDown.svg',
                          height: 18,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '102, Raycon Orchard, A Block, 87, 4th cro...',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: Row(
            children: [
              Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: _isScrolled
                        ? AppColors.primary
                        : AppColors.primary.withOpacity(0.5),
                  ),
                  boxShadow: _isScrolled
                      ? []
                      : [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/buyone.png',
                  height: 28,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: _isScrolled
                      ? AppColors.primary.withOpacity(0.1)
                      : Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(Icons.person,
                    color: _isScrolled ? AppColors.primary : Colors.grey[200]),
              ),
            ],
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: _isScrolled
                  ? []
                  : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for '${widget.hints[widget.currentHintIndex]}'",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search,
                    color: _isScrolled ? AppColors.primary : Colors.grey[600]),
                suffixIcon: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.grey.shade500,
                      ),
                      Icon(Icons.mic,
                          color: _isScrolled ? AppColors.primary : AppColors.primary),
                    ],
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: _isScrolled ? AppColors.primary : Colors.transparent,
                    width: _isScrolled ? 1.0 : 0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: _isScrolled ? AppColors.primary : Colors.transparent,
                    width: _isScrolled ? 1.0 : 0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: _isScrolled ? AppColors.primary : Colors.transparent,
                    width: _isScrolled ? 1.5 : 0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
