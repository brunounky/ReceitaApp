import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class ApiService {
  static const String _baseUrl = 'https://dummyjson.com/recipes';

  Future<List<Recipe>> searchRecipes(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl/search?q=$query'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> recipesJson = data['recipes'];
      return recipesJson.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar as receitas');
    }
  }
}