import 'package:bloc/bloc.dart';
import 'package:playground/src/features/domain/usecases/get_movie_detail_usecase.dart';
import 'package:playground/src/features/presentation/bloc/movie_detail/movie_detail_event.dart';
import 'package:playground/src/features/presentation/bloc/movie_detail/movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase getMovieDetailUseCase;

  MovieDetailBloc(this.getMovieDetailUseCase) : super(MovieDetailLoading()) {
    on<GetMovieDetailEvent>((event, emit) async {
      emit(MovieDetailLoading());
      final result =
      await getMovieDetailUseCase.getMovieDetailAndReview(event.movieId);

      result.fold((error) {
        emit(MovieDetailError(error.message));
      }, (data) {
        emit(MovieDetailSuccess(movieDetailAndReview: data));
      });
    });
  }
}
