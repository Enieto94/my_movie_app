import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/movie_provider.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context); // Accede al proveedor

    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Películas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Nombre de la película",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Realiza la búsqueda al presionar el botón
                    final query = _searchController.text;
                    if (query.isNotEmpty) {
                      movieProvider.searchMovies(query);
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            movieProvider.isLoading
                ? CircularProgressIndicator() // Muestra un indicador de carga
                : Expanded(
              child: ListView.builder(
                itemCount: movieProvider.movies.length,
                itemBuilder: (context, index) {
                  final movie = movieProvider.movies[index];
                  return MovieCard(movie: movie);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
