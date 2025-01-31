import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const BodyText(this.text,
      {super.key,
      this.style,
      this.textAlign,
      this.fontWeight,
      this.overflow,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    const TextStyle baseStyle =
        TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
    final TextStyle finalStyle = baseStyle.merge(style).copyWith(
          fontWeight: fontWeight,
        );
    return Text(
      text,
      style: finalStyle,
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
