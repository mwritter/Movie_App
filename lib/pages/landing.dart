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
          title: Text("Play Movies",
              style: TextStyle(color: Colors.red, fontSize: 35.0)),
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
              height: 250.0,
              width: 300.0,
              child: HorizontalScroll(),
            ),
            MovieSection("What's New"),
          ],
        ));
  }
}
