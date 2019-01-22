import 'package:flutter/material.dart';
import 'package:movie_app/models/movies.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HorizontalScroll extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HorizontalScrollState();
  }
}

class _HorizontalScrollState extends State<HorizontalScroll> {
  //final List movies = [];
  List<Movie> movies = new List();

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

  fetch() async {
    final response = await http.get(
        "https://api.themoviedb.org/3/discover/movie?api_key=9cede68bb44b4167b04810a464d9e2c1&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1");

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      //print("jsonResponse looks like this: ${jsonResponse['results']}");
      movies = _makeMovieList(3, jsonResponse);
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  List<Movie> _makeMovieList(int size, jsonResponse) {
    List<Movie> movies = [];
    for (int i = 0; i < size; i++) {
      movies.add(new Movie(
          id: jsonResponse['results'][i]['id'],
          image: jsonResponse['results'][i]['poster_path'],
          title: jsonResponse['results'][i]['title'],
          voteAverage: jsonResponse['results'][i]['vote_average']));
    }
    return movies;
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }
}
