import 'package:get_it/get_it.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:playground/src/features/data/api/movie_api.dart';
import 'package:playground/src/features/data/api/movie_api_impl.dart';
import 'package:playground/src/features/data/repositories/movie_repository_impl.dart';
import 'package:playground/src/features/domain/repositories/movie_repository.dart';
import 'package:playground/src/features/domain/usecases/get_movie_list_usecase.dart';

import '../../core/network/interceptor.dart';

GetIt getIt = GetIt.instance;

initInjections() {
  injectMovieModule();
}

/// Inject movie use case and its data sources
injectMovieModule() {
  Client client = InterceptedClient.build(interceptors: [ApiInterceptor()]);
  MovieApi movieApi = MovieApiImpl(client);
  MovieRepository movieRepository = MovieRepositoryImpl(movieApi);
  GetMovieListUseCase useCase = GetMovieListUseCaseImpl(movieRepository);
  getIt.registerSingleton(useCase);
}
