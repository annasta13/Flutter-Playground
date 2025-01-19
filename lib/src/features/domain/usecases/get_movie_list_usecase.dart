import 'package:dartz/dartz.dart';
import 'package:playground/src/features/domain/repositories/movie_repository.dart';

import '../../data/dto/api_error.dart';
import '../models/movie_list.dart';

abstract class GetMovieListUseCase {
  Future<Either<ApiError, MovieList>> fetchMoviesList(String urlPath, int page);
}

class GetMovieListUseCaseImpl extends GetMovieListUseCase {
  final MovieRepository movieRepository;

  GetMovieListUseCaseImpl(this.movieRepository);

  @override
  Future<Either<ApiError, MovieList>> fetchMoviesList(String urlPath, int page) {
    return movieRepository.fetchMovieList(urlPath, page);
  }
}
