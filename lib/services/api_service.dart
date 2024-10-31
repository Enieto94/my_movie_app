import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import '../utils/constants.dart';

class ApiService {
  Future<List<Movie>> fetchMovies(String query) async {
    final response = await http.get(Uri.parse('${Constants.baseUrl}/search/movie?query=$query&api_key=${Constants.apiKey}'));
    if (response.statusCode == 200) {
      final List movies = json.decode(response.body)['results'];
      return movies.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar películas');
    }
  }
}