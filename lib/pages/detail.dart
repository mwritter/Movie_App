import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movies.dart';

class DetailPage extends StatefulWidget {
  final Movie movie;
  DetailPage(this.movie);
  @override
  State<StatefulWidget> createState() {
    return DetailPageState();
  }
}

class DetailPageState extends State<DetailPage> {
  Widget _buildStack() {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Material(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
          elevation: 3.0,
          child: Container(
            height: deviceHeight * 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                alignment: Alignment.center,
                image: NetworkImage(widget.movie.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          height: deviceHeight * 2,
          child: ClipRect(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                height: double.infinity,
                decoration:
                    new BoxDecoration(color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Hero(
                  tag: widget.movie.id,
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 3.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: NetworkImage(widget.movie.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Wrap(
                children: <Widget>[
                  Text(
                    widget.movie.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 35.0,
                    ),
                  ),
                  Text(
                    " ${widget.movie.voteAverage}/10",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 35.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                widget.movie.overview,
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Roboto', fontSize: 15.0),
              ),
              _buildButtonRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonRow() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  child: new ClipRect(
                    child: new BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: new Container(
                        width: 100.0,
                        height: 40.0,
                        decoration: new BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: new Center(
                          child: new Text('RATE MOVIE',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  child: new ClipRect(
                    child: new BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: new Container(
                        height: 40.0,
                        decoration: new BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: new Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: Stack(
              children: <Widget>[
                Container(
                  child: new ClipRect(
                    child: new BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: new Container(
                        height: 40.0,
                        decoration: new BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: new Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: new Icon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: CustomScrollView(slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                _buildStack(),
              ],
            ),
          ),
        ]));
  }
}
