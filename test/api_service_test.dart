import 'package:flutter_test/flutter_test.dart';
import 'package:my_movie_app/services/api_service.dart';

void main() {
  test('Debería obtener lista de películas', () async {
    final api = ApiService();
    final movies = await api.fetchMovies('Inception');
    expect(movies.isNotEmpty, true);
  });
}