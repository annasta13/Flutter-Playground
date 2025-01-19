import 'package:flutter/material.dart';
import 'package:playground/src/features/domain/models/movie_item.dart';
import 'package:playground/src/features/presentation/pages/movie_detail/movie_detail_page.dart';
import 'package:playground/src/features/presentation/widgets/body_text.dart';
import 'package:playground/src/features/presentation/widgets/title_text.dart';

class MovieListItemView extends StatelessWidget {
  final List<MovieItem> items;
  final bool hasMore;
  final ScrollController scrollController;

  const MovieListItemView(
      {required this.items,
      required this.hasMore,
      required this.scrollController,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: items.length,
      itemBuilder: (context, index) {
        if (index == items.length) {
          if (hasMore) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const SizedBox.shrink(); // No more data to load
          }
        } else {
          final movie = items[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieDetailPage(movieId: movie.movieId);
                }));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.network(
                      movie.posterPath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.broken_image, size: 40); // Fallback icon
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Add spacing between the image and text
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(movie.originalTitle),
                        const SizedBox(height: 4),
                        BodyText(
                          movie.overview,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
