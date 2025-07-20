import 'package:flutter/material.dart';
import 'package:food/view/ui/home/top_restaurants_section.dart';
import 'package:food/view/ui/home/your_mind.dart';
import '../../widget/app_bar.dart';
import 'image_carousel.dart';
import '../../widget/home/offer_banner.dart';
import 'lottie_tiles.dart';
import 'promo_tiles.dart';
import 'ninety_nine_store_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomHomeAppBar(hints: ["Milk", "Bread", "Fruits"], currentHintIndex: 0),
          const SliverToBoxAdapter(child: LottieTiles()),
          const SliverToBoxAdapter(child: AssetImageCarousel(imagePaths: ['assets/carsol_1.png', 'assets/carsol_4.png', 'assets/Home Card@2x.png', 'assets/carsol_3.png',],),),
          const SliverToBoxAdapter(child: NinetyNineStoreSection()),
          const SliverToBoxAdapter(child: OfferBanner()),
          const SliverToBoxAdapter(child: PromoTiles()),
          const SliverToBoxAdapter(child: YourMind()),
          const SliverToBoxAdapter(child: TopRestaurantsSection()),
        ],
      ),
    );
  }
}
