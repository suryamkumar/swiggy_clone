import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../bloc/product_bloc.dart';
import '../../../model/product_model.dart';
import '../../shimmer/home/shimmer_99_store.dart';

class NinetyNineStoreSection extends StatelessWidget {
  const NinetyNineStoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerBox(width: 100, height: 28, borderRadius: BorderRadius.circular(4)),
                    ShimmerBox(width: 60, height: 20, borderRadius: BorderRadius.circular(4)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.grey[300], size: 15),
                    const SizedBox(width: 4),
                    ShimmerBox(width: 180, height: 12, borderRadius: BorderRadius.circular(2)),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (context, index) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return _ShimmerStoreCard();
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProductLoaded) {
          final recipes = state.product.recipes ?? [];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [?Colors.blue[50], Colors.white], // gradient colors
                    begin: Alignment.topCenter, // starting point
                    end: Alignment.bottomCenter, // ending point
                  ),
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/99_store.png', height: 28,),
                        Row(
                          children: [
                            Text("See All", style: GoogleFonts.poppins(color: Colors.blue, fontWeight: FontWeight.w600)),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue, size: 14,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.black87, size: 15,),
                        SizedBox(width: 4),
                        Text("Free delivery with ecosaver mode", style: TextStyle(color: Colors.black.withValues(alpha: 0.8), fontSize: 12, fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        return _StoreFoodCard(recipe: recipe);
                      },
                    ),
                  ),
                ],
              ),
            ),
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
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8), // updated radius
                  child: Image.network(
                    recipe.image ?? '',
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                  ),
                ),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(Icons.add, color: Colors.teal, size: 18),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13,height: 0),
                ),
                const SizedBox(height: 4),

                if (recipe.rating != null)
                  Row(
                    children: [
                      Icon(Icons.star_rounded, color: Colors.teal, size: 14),
                      const SizedBox(width: 3),
                      Text(
                        "${recipe.rating?.toStringAsFixed(1)}",
                        style: TextStyle(color: Colors.teal, fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 2),
                      Text("[${recipe.reviewCount ?? 0}]", style: const TextStyle(fontSize: 11, color: Colors.teal, fontWeight: FontWeight.w500)),
                    ],
                  ),
                SizedBox(height: 4,),
                IntrinsicWidth( // Ensures container only expands to content width
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(2),
                      border: Border(
                        right: BorderSide(color: Colors.black, width: 1),  // right border
                        bottom: BorderSide(color: Colors.black, width: 1), // bottom border
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // ensures row shrinks to fit its children
                      children: [
                        const Icon(Icons.currency_rupee, size: 14, color: Colors.black),
                        Text(
                          recipe.caloriesPerServing?.toString() ?? '0',
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class _ShimmerStoreCard extends StatelessWidget {
  const _ShimmerStoreCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerBox(width: 100, height: 100),
          const SizedBox(height: 8),
          ShimmerBox(width: 90, height: 12),
          const SizedBox(height: 4),
          ShimmerBox(width: 60, height: 10),
          const SizedBox(height: 4),
          ShimmerBox(width: 40, height: 14),
        ],
      ),
    );
  }
}