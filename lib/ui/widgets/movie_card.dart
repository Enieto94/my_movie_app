import 'package:flutter/material.dart';
import '../../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.network(
          'https://image.tmdb.org/t/p/w500${movie.posterPath}', // Ruta de la imagen de la API
          fit: BoxFit.cover,
          width: 50,
        ),
        title: Text(movie.title),
        subtitle: Text("Estreno: ${movie.releaseDate}"),
        onTap: () {
          // Navegar a la pantalla de detalles
        },
      ),
    );
  }
}
