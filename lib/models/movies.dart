class Movie {
  final int id;
  String title;
  String titleShort;
  String image;
  final String overview;
  String overviewShort;

  Movie({this.overview, this.id, this.title, this.image}) {
    _imageWithURL();
    _twoLineOverview();
    _titleSizing();
  }

  _titleSizing() {
    List<String> titleArray = title.split(" ");
    titleShort = title;
    if (titleArray.length > 4) {
      this.titleShort = '${titleArray[0]} ${titleArray[1]} ${titleArray[2]}...';
    }

    if (titleShort.length > 30) {
      this.titleShort = titleShort.substring(0, 30) + "...";
    }
  }

  _imageWithURL() {
    this.image = 'https://image.tmdb.org/t/p/w500/$image';
  }

  _twoLineOverview() {
    this.overviewShort = overview;
    if (overviewShort.length >= 50) {
      this.overviewShort = overview.substring(0, 50) + "...";
    }
  }
}
