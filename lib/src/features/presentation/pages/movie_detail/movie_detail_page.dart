import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground/src/features/presentation/bloc/movie_detail/movie_detail_event.dart';
import 'package:playground/src/features/presentation/pages/movie_detail/review_item_view.dart';
import 'package:playground/src/features/presentation/widgets/title_text.dart';

import '../../bloc/movie_detail/movie_detail_bloc.dart';
import '../../bloc/movie_detail/movie_detail_state.dart';
import '../../widgets/page_container.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  State<StatefulWidget> createState() => _MovieDetailPage();
}

class _MovieDetailPage extends State<MovieDetailPage> {
  late MovieDetailBloc _bloc;
  String? expandedReviewId;

  @override
  void initState() {
    _bloc = BlocProvider.of<MovieDetailBloc>(context);
    _bloc.add(GetMovieDetailEvent(movieId: widget.movieId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
      return PageContainer(
        barTitle: "Movie Detail",
        loading: state is MovieDetailLoading,
        errorMessage: state is MovieDetailError ? state.message : null,
        successState: state is MovieDetailSuccess ? state : null,
        child: (dataState) {
          final movie = dataState.movieDetailAndReview.movieDetail;
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Image.network(
                        movie.posterPath,
                        fit: BoxFit.fitHeight,
                        height: 200,
                      )),
                  TitleText(movie.originalTitle, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  Text("Overview: ${movie.overview}",
                      textAlign: TextAlign.justify),
                  const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text("Reviews:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))),
                  ...dataState.movieDetailAndReview.reviewList
                      .map((review) => ReviewItemView(
                            review: review,
                            isExpanded: expandedReviewId == review.id,
                            onExpand: () {
                              setState(() {
                                if (expandedReviewId == review.id) {
                                  expandedReviewId = null;
                                } else {
                                  expandedReviewId = review.id;
                                }
                              });
                            },
                          ))
                ],
              ));
        },
      );
    });
  }
}
