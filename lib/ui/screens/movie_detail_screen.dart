import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: EdgeI+nsets.all(16.0),
        child: Column(
          children: [
            Text(movie.overview),
            SizedBox(height: 10),
            Text("Fecha de estreno: ${movie.releaseDate}"),
            // Mostrar más detalles aquí
          ],
        ),
      ),
    );
  }
}