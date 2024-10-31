import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class MovieProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Movie> _movies = [];
  bool _isLoading = false;

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;

  Future<void> searchMovies(String query) async {
    _isLoading = true;
    notifyListeners(); // Notifica a los widgets que el estado ha cambiado

    try {
      _movies = await _apiService.fetchMovies(query); // Llama a la API para obtener películas
    } catch (error) {
      _movies = []; // Si hay un error, lista de películas vacía
    } finally {
      _isLoading = false;
      notifyListeners(); // Notifica a los widgets que la búsqueda ha terminado
    }
  }
}
