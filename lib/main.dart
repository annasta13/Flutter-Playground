import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/src/features/di/dependency_injection.dart';
import 'package:playground/src/features/domain/usecases/get_movie_detail_usecase.dart';
import 'package:playground/src/features/domain/usecases/get_movie_list_usecase.dart';
import 'package:playground/src/features/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:playground/src/features/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:playground/src/features/presentation/pages/movie_list/movie_list_page.dart';

void main() {
  initInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  MovieListBloc(getIt.get<GetMovieListUseCase>())),
          BlocProvider(
              create: (context) =>
                  MovieDetailBloc(getIt.get<GetMovieDetailUseCase>())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MovieListPage(),
        ));
  }
}
