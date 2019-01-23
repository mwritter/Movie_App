import 'package:flutter/material.dart';
import 'package:movie_app/models/movies.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:ui';

import 'package:movie_app/pages/detail.dart';

class PopularScroll extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PopularScrollState();
  }
}

class _PopularScrollState extends State<PopularScroll> {
  List<Movie> movies = new List();

  Widget _buildMoviePoster(Movie movie) {
    return Hero(
      tag: movie.id,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailPage(movie)));
        },
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: 3.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                alignment: Alignment.center,
                image: NetworkImage(movie.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: movies.length,
        itemExtent: 250.0,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              child: Stack(
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.all(20.0),
                    child: _buildMoviePoster(movies[index]),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(movies[index])));
                      },
                      child: ClipRect(
                        child: new BackdropFilter(
                          filter:
                              new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: new Container(
                            margin: EdgeInsets.all(30.0),
                            padding: EdgeInsets.all(10.0),
                            width: 200.0,
                            height: double.infinity,
                            decoration: new BoxDecoration(
                                color: Colors.grey.shade200.withOpacity(0.5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  movies[index].titleShort,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF270A41),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(movies[index].overviewShort),
                                Text(
                                  "Read more",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF706579)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  fetch() async {
    final response = await http.get(
        "https://api.themoviedb.org/3/discover/movie?api_key=9cede68bb44b4167b04810a464d9e2c1&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1");
    if (response.statusCode == 200) {
      print("Got the data");
      var jsonResponse = convert.jsonDecode(response.body);
      //print("jsonResponse looks like this: ${jsonResponse['results']}");
      setState(() {
        movies = _makeMovieList(20, jsonResponse);
      });
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  List<Movie> _makeMovieList(int size, jsonResponse) {
    List<Movie> movies = [];
    for (int i = 0; i < size; i++) {
      movies.add(new Movie(
        overview: jsonResponse['results'][i]['overview'],
        id: jsonResponse['results'][i]['id'],
        image: jsonResponse['results'][i]['poster_path'],
        title: jsonResponse['results'][i]['title'],
        voteAverage: jsonResponse['results'][i]['vote_average'],
        //voteAverage: jsonResponse['results'][i]['vote_average'])
      ));
    }
    return movies;
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }
}
