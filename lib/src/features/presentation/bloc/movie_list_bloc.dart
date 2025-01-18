import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/src/features/domain/models/movie_item.dart';
import 'package:playground/src/features/domain/usecases/get_movie_list_usecase.dart';
import 'package:playground/src/features/presentation/bloc/get_movie_list_event.dart';

import 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetMovieListUseCase getMovieListUseCase;
  List<MovieItem> allMovies = []; // Holds the list of all fetched movies
  int currentPage = 1; // Track the current page
  bool hasMore = true; // Whether there are more pages to load

  MovieListBloc(this.getMovieListUseCase) : super(MovieLoading()) {
    on<GetMovieListEvent>((event, emit) async {
      if (event.page == 1) {
        emit(MovieLoading());
      }
      //
      final result =
          await getMovieListUseCase.getMovieList(event.urlPath, event.page);
      result.fold(
        (error) {
          emit(MovieError(error.message)); // Handle error
        },
        (movies) {
          allMovies.addAll(movies.items); // Add new movies to the list
          hasMore = (movies.totalPages ?? 0) >
              (movies.page ?? 0); // Check if we received movies (more pages)
          emit(MovieSuccess(allMovies, hasMore));
        },
      );
    });
  }

  void setCurrentPage(int value) {
    currentPage = value;
  }
}
