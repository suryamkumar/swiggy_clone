import 'package:flutter/material.dart';

import '../../../model/product_model.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<ProductDetailPage> {
  Recipe? _recipe;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchRecipe();
  }

  Future<void> _fetchRecipe() async {
    // Replace this with your real API or BLoC call
    await Future.delayed(const Duration(seconds: 1)); // simulate network

    // Simulated data - in real case, filter from API or state using widget.productId
    final mockRecipe = Recipe(
      id: int.tryParse(widget.productId),
      name: "Delicious Pasta",
      image: "https://via.placeholder.com/150",
      rating: 4.5,
      cookTimeMinutes: 20,
      servings: 2,
      difficulty: Difficulty.MEDIUM,
      cuisine: "Italian",
      ingredients: ["Pasta", "Tomato", "Cheese"],
      instructions: ["Boil pasta", "Add sauce", "Serve hot"],
    );

    setState(() {
      _recipe = mockRecipe;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_recipe == null) {
      return const Scaffold(body: Center(child: Text("Recipe not found")));
    }

    return Scaffold(
      appBar: AppBar(title: Text(_recipe!.name ?? 'Recipe')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(_recipe!.image ?? '', height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text("Cuisine: ${_recipe!.cuisine ?? 'N/A'}"),
            Text("Cook Time: ${_recipe!.cookTimeMinutes} mins"),
            Text("Servings: ${_recipe!.servings}"),
            Text("Difficulty: ${difficultyValues.reverse[_recipe!.difficulty]}"),
            const SizedBox(height: 12),
            const Text("Ingredients:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...?_recipe!.ingredients?.map((i) => Text("- $i")),
            const SizedBox(height: 12),
            const Text("Instructions:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...?_recipe!.instructions?.map((s) => Text("• $s")),
          ],
        ),
      ),
    );
  }
}
