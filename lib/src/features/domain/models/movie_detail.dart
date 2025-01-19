class MovieDetail {
  final int id;
  final bool adult;
  final int budget;
  final String? homepage;
  final String originalTitle;
  final String? overview;
  final double popularity;
  final String posterPath;
  final String title;
  final String releaseDate;
  final double voteAverage;

  MovieDetail({
    required this.id,
    required this.adult,
    required this.budget,
    this.homepage,
    required this.originalTitle,
    this.overview,
    required this.popularity,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
  });
}
