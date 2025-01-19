import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/src/features/domain/models/url_path.dart';
import 'package:playground/src/features/presentation/bloc/movie_list/get_movie_list_event.dart';
import 'package:playground/src/features/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:playground/src/features/presentation/bloc/movie_list/movie_list_state.dart';
import 'package:playground/src/features/presentation/pages/movie_list/movie_list_item.dart';
import 'package:playground/src/features/presentation/widgets/page_container.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<StatefulWidget> createState() => _MoveListPage();
}

class _MoveListPage extends State<MovieListPage> {
  final ScrollController _scrollController = ScrollController();
  late MovieListBloc _movieBloc;
  String urlPath = UrlPath.popularMovies;

  @override
  void initState() {
    _movieBloc = BlocProvider.of<MovieListBloc>(context);
    _movieBloc.add(GetMovieListEvent(urlPath, 1));
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels == 0) {
      } else {
        if (_movieBloc.state is MovieSuccess) {
          final currentState = _movieBloc.state as MovieSuccess;
          if (currentState.hasMore) {
            final nextPage = (_movieBloc.currentPage + 1);
            _movieBloc.add(GetMovieListEvent(urlPath, nextPage));
            _movieBloc.setCurrentPage(nextPage); // Update the current page
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
      return PageContainer(
        barTitle: "Movie List",
        loading: state is MovieLoading,
        errorMessage: state is MovieError ? state.message : null,
        successState: state is MovieSuccess ? state : null,
        child: (dataState) {
          return MovieListItemView(
            hasMore: dataState.hasMore,
            items: (dataState).movies,
            scrollController: _scrollController,
          );
        }, // widget:
      );
    });
  }
}
