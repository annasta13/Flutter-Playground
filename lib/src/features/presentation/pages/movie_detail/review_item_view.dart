import 'package:flutter/material.dart';
import 'package:playground/src/features/presentation/widgets/body_text.dart';

import '../../../domain/models/review.dart';

class ReviewItemView extends StatelessWidget {
  final Review review;
  final bool isExpanded;
  final Function() onExpand;

  const ReviewItemView(
      {super.key,
      required this.review,
      required this.isExpanded,
      required this.onExpand});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 14);
    final maxWidth = MediaQuery.of(context).size.width - 60;
    bool hasReadMore = showReadMore(review.content, textStyle, maxWidth);
    return Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Align content to the start
          children: [
            Row(
              children: [
                ClipOval(
                    child: Image.network(
                  review.avatarPath,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 2),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 20, // Icon size
                        color: Colors.black, // Icon color
                      ),
                    );
                  },
                )),
                const SizedBox(width: 8),
                Expanded(
                  child: BodyText(
                    review.author,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8), // Add spacing between rows
            BodyText(
              review.content,
              maxLines: isExpanded ? null : 3, // Expanded or truncated
              overflow:
                  isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 4),
            if (hasReadMore)
            GestureDetector(
              onTap: () {
                onExpand();
              },
              child: Text(
                isExpanded ? "Read less" : "Read more",
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            const Divider(),
          ],
        ));
  }
}


bool showReadMore(String content, TextStyle style, double maxWidth) {
  final textSpan = TextSpan(text: content, style: style);
  final textPainter = TextPainter(
    text: textSpan,
    maxLines: 3,  // Limit to 3 lines
    textDirection: TextDirection.ltr,
  );

  // Use the width constraint of the screen/widget
  textPainter.layout(maxWidth: maxWidth);

  // Check if the content requires more than 3 lines
  return textPainter.didExceedMaxLines;
}
