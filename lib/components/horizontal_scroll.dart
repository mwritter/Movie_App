import 'package:flutter/material.dart';
import 'package:movie_app/models/movies.dart';

class HorizontalScroll extends StatelessWidget {
  final List<Movie> movies;
  HorizontalScroll({this.movies});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemExtent: 300.0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 3.0,
              child: Center(
                child: Text(movies[index].title),
              ),
            ),
          );
        },
      ),
    );
  }
}
