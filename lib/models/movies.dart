class Movie {
  final int id;
  final double voteAverage;
  final String title;
  String image;

  Movie({this.id, this.title, this.voteAverage, this.image}) {
    _imageWithURL();
  }

  _imageWithURL() {
    this.image = 'https://image.tmdb.org/t/p/w500/$image';
  }
}
