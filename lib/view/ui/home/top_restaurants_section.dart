import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../bloc/product_bloc.dart';
import '../../../model/product_model.dart';

class TopRestaurantsSection extends StatelessWidget {
  const TopRestaurantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16, bottom: 0, top: 16),
                child: Text(
                  "Top restaurants to explore",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (_, __) => const _ShimmerStoreFoodCard(),
              ),
            ],
          );
        } else if (state is ProductLoaded) {
          final recipes = state.product.recipes ?? [];
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16, bottom: 0),
                child: Text(
                  "Top restaurants to explore",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return _StoreFoodCard(recipe: recipes[index]);
                },
              ),
            ],
          );
        } else {
          return const Center(child: Text("Something went wrong"));
        }
      },
    );
  }
}
class _StoreFoodCard extends StatelessWidget {
  final Recipe recipe;

  const _StoreFoodCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:20, vertical: 8), // Only bottom margin
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  recipe.image ?? '',
                  height: 170,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 8,
                child: Text(
                  "ITEMS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                left: 8,
                child: Text(
                  "AT ₹${recipe.caloriesPerServing ?? 99}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Positioned(
                bottom: 4,
                right: 4,
                child: Text("AD",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ),
              const Positioned(
                top: 6,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.white, size: 24),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("Bolt⚡", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange)),
                    const SizedBox(width: 4),
                    Text("Food in ${recipe.cookTimeMinutes ?? 15} min", style: const TextStyle(fontSize: 13, color: Colors.black54,fontWeight: FontWeight.bold)),
                    const Spacer(),
                    const Icon(Icons.more_vert, size: 18, color: Colors.black54),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  recipe.name ?? 'Store Name',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Icon(Icons.stars, size: 18, color: Colors.green[900]),
                    const SizedBox(width: 4),
                    Text(
                      "${recipe.rating?.toStringAsFixed(1) ?? '4.2'} (${recipe.reviewCount ?? '67k+'})",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "• ${recipe.prepTimeMinutes ?? '10-15'} mins",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  recipe.tags?.join(', ') ?? "Chinese, Healthy Food, Tandoori",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(
                  "Brookefield • ${recipe.userId != null ? '${recipe.userId}m' : '0.9 m'}",
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Colors.white, Color(0xFFFFCDD2)],
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "FREE DELIVERY",
                            style: TextStyle(
                              color: Colors.red[600],
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 40),
                          Column(
                            children: [
                              Image.asset('assets/buyone.png', height: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 0.25,
                                  ),
                                  color: Colors.white,
                                ),
                                child: const Text(
                                  "LITE",
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ShimmerStoreFoodCard extends StatelessWidget {
  const _ShimmerStoreFoodCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  4,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Container(
                      height: 10,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}