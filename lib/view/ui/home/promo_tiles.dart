import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/utils/color.dart';
import 'package:shimmer/shimmer.dart';
import '../../../bloc/product_bloc.dart';
import '../../../model/product_model.dart';
import '../../shimmer/home/top_rated_shimmer.dart';

class PromoTiles extends StatelessWidget {
  const PromoTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
            child: Row(
              children: const [
                Text("TOP RATED NEAR YOU",
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
                SizedBox(width: 12),
              ],
            ),
          ),

          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return SizedBox(
                  height: 280,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    padding: const EdgeInsets.only(right: 12),
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) =>  _ShimmerRestaurantCard(),
                  ),
                );
              } else if (state is ProductLoaded) {
                final recipes = state.product.recipes ?? [];
                return SizedBox(
                  height: 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      return _RestaurantCard(recipe: recipes[index]);
                    },
                  ),
                );
              } else {
                return const Text("Something went wrong");
              }
            },
          ),
        ],
      ),
    );
  }
}
class _RestaurantCard extends StatelessWidget {
  final Recipe recipe;

  const _RestaurantCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    final prep = recipe.prepTimeMinutes ?? 0;
    final cook = recipe.cookTimeMinutes ?? 0;
    final totalTime = prep + cook;

    final tagsText = (recipe.tags?.isNotEmpty ?? false)
        ? recipe.tags!.take(2).join(", ")
        : recipe.cuisine ?? "Indian";

    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  recipe.image ?? '',
                  height: 210,
                  width: 160,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image),
                ),
              ),
              // Free Delivery badge
              Positioned(
                top: 16,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.pink, AppColors.primary.withValues(alpha: 0.8)], // gradient colors
                      begin: Alignment.topLeft, // starting point
                      end: Alignment.bottomRight,
                    ),// ending point
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/buyone.png', color: AppColors.white,width: 24,),
                      const Text(
                        "  Free Delivery", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              // Calories display
              Positioned(
                bottom: 28,
                left: 8,
                child: Text(
                  "ITEMS",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14,
                    shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  "AT ₹${recipe.caloriesPerServing ?? 199}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17,
                    shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                  ),
                ),
              ),
              // Like icon
              Positioned(
                top: 14,
                right: 6,
                child: Icon(Icons.favorite_border, color: Colors.white, size: 22,),
              )
            ],
          ),

          const SizedBox(height: 8),
          // Title
          Text(
            recipe.name ?? 'Unknown Dish',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Icon(Icons.stars, color: Colors.green[900], size: 16),
              const SizedBox(width: 2),
              Text(
                "${recipe.rating?.toStringAsFixed(1) ?? "4.2"} ",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 2),
              Text(
                "• ${totalTime > 0 ? "$totalTime mins" : "25-30 mins"}",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text(
            tagsText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 11, color: Colors.black54, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _ShimmerRestaurantCard extends StatelessWidget {
  const _ShimmerRestaurantCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 210,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 14,
            width: 120,
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Container(
            height: 14,
            width: 100,
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Container(
            height: 12,
            width: 80,
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
