
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:personal_hub_app/data/dtos/food_dto.dart';
import 'package:personal_hub_app/data/mappers/food_mapper.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';

/// Service to interact with food-related backend endpoints.
class FoodService {
  /// The base URL of the backend API.
  final String baseUrl;

  FoodService({required this.baseUrl});

  /// Searches for food items via the /search endpoint.
  ///
  /// [query]: the search string entered by the user.
  /// [limit]: the maximum number of results (default 10).
  /// Returns a list of [FoodAutoFillEntity]s on success.
  /// Throws an Exception if the request fails.
  Future<List<FoodAutoFillEntity>> searchFood(String query, {int limit = 10}) async {
    final uri = Uri.parse('$baseUrl/search').replace(queryParameters: {
      'query': query,
      'limit': limit.toString(),
    });

    final response = await http.get(uri);
    if (response.statusCode >= 400) {
      throw Exception('Failed to search foods: \\${response.body}');
    }
    final data = jsonDecode(response.body);
    if (data is! List) {
      throw Exception('Malformed response for food search');
    }
    return data
        .map((json) => FoodAutoFillDto.fromJson(json as Map<String, dynamic>).toEntity())
        .toList();
  }

  /// Fetches a food product by its [id] via the /getById endpoint.
  ///
  /// Returns a [FoodProductEntity] on success, or null if not found.
  /// Throws an Exception for bad HTTP responses or data.
  Future<FoodProductEntity?> getFoodProductById(String id) async {
    final uri = Uri.parse('$baseUrl/getById').replace(queryParameters: {
      'id': id,
    });
    final response = await http.get(uri);
    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch product by id: ${response.body}');
    }
    if (response.body.isEmpty) return null;
    final data = jsonDecode(response.body);
    if (data == null) return null;
    return FoodProductDto.fromJson(data as Map<String, dynamic>).toEntity();
  }

  /// Fetches a food product by its [barcode] via the /getByBarcode endpoint.
  ///
  /// Returns a [FoodProductEntity] on success, or null if not found.
  /// Throws an Exception for bad HTTP responses or data.
  Future<FoodProductEntity?> getFoodProductByBarcode(String barcode) async {
    final uri = Uri.parse('$baseUrl/getByBarcode').replace(queryParameters: {
      'barcode': barcode,
    });
    final response = await http.get(uri);
    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch product by barcode: ${response.body}');
    }
    if (response.body.isEmpty) return null;
    final data = jsonDecode(response.body);
    if (data == null) return null;
    return FoodProductDto.fromJson(data as Map<String, dynamic>).toEntity();
  }
}
