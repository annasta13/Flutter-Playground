import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  const TitleText(this.text,
      {super.key, this.style, this.textAlign, this.overflow, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    const TextStyle baseStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    final TextStyle finalStyle = baseStyle.merge(style).copyWith(
          fontWeight: fontWeight,
        );
    return Text(
      text,
      style: finalStyle,
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
    );
  }
}
