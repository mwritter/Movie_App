import 'package:flutter/material.dart';
import 'package:movie_app/components/horizontal_scroll.dart';
import 'package:movie_app/components/section_view.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            children: <Widget>[
              Text("Play ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: 'OpenSans')),
              Text("Movies",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30.0,
                      fontFamily: 'OpenSans')),
            ],
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.cast),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 150.0,
              width: 250.0,
              child: HorizontalScroll(),
            ),
            MovieSection("What's New"),
            MovieSection("Recommended for you"),
          ],
        ));
  }
}
