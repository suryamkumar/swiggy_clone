  import 'dart:developer';
  import 'package:food/constant/url.dart';
  import 'package:http/http.dart' as http;
  import '../../model/product_model.dart';

  class ProductRepo {

    Future<Product> fetchProduct({
      int total= 50,
      int skip = 0,
      int limit = 30,
    }) async {
      final queryParams = {
        'skip': skip.toString(),
        'limit': limit.toString(),
      };

      final uri = Uri.parse('$baseUrl/recipes').replace(queryParameters: queryParams);

      log('API Call: $uri');

      final response = await http.get(uri, headers: {
        "Content-Type": "application/json",
      });

      log('Recipe API status: ${response.statusCode}');
      log('Recipe API body: ${response.body}');

      if (response.statusCode == 200) {
        return productFromJson(response.body);
      } else {
        throw Exception('Failed to load recipes: ${response.statusCode}');
      }
    }
  }
