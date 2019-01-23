import 'package:flutter/material.dart';
import 'package:movie_app/components/popular_scroll.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "MovieStar",
          style: TextStyle(
              fontSize: 15.0, color: Colors.grey, fontFamily: 'OpenSans'),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Text(
              "Top Rated",
              style: TextStyle(
                letterSpacing: 1.2,
                fontFamily: 'Roboto',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF270A41),
              ),
            ),
          ),
          Container(margin: EdgeInsets.only(top: 70.0), child: PopularScroll()),
        ],
      ),
    );
  }
}
