import 'package:flutter/material.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List movies = ["Avengers", "Jurassic World", "Ready Player One"];
  MovieSection(this.title);

  Widget _buildMoviePosterRow(context) {
    double size = MediaQuery.of(context).size.width * 0.3;
    return Row(
      children: <Widget>[
        _buildMoviePosters(movies[0], size),
        _buildMoviePosters(movies[1], size),
        _buildMoviePosters(movies[2], size),
      ],
    );
  }

  Widget _buildMoviePosters(String title, double size) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0, left: 10.0, top: 10.0),
      width: size,
      height: 155.0,
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 3.0,
        child: Center(child: Text(title)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontFamily: 'OpenSans'),
                ),
                Spacer(),
                Text(
                  "View All",
                  style: TextStyle(
                      color: Colors.blueAccent, fontFamily: 'OpenSans'),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            _buildMoviePosterRow(context)
          ],
        ));
  }
}
