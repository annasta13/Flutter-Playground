import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  // Constructor with optional parameters
  const BodyText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    // Define default style
    const TextStyle defaultStyle = TextStyle(
      fontFamily: 'Roboto', // Default font
      fontSize: 16, // Default font size
      color: Colors.black, // Default color
    );

    // Combine the default style with the custom style provided (if any)
    final TextStyle finalStyle = style ?? defaultStyle;

    return Text(
      text,
      style: finalStyle,
      textAlign: textAlign ?? TextAlign.start, // Default alignment is start
    );
  }
}
