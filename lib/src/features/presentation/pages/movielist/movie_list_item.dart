import 'package:flutter/material.dart';
import 'package:playground/src/features/domain/models/movie_item.dart';

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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Expanded(
              flex: 1,
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                ),
              ),
                const SizedBox(width: 8), // Add spacing between the image and text
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.originalTitle,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        movie.overview,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
