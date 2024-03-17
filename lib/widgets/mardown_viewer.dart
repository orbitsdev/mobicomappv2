// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class MarkdownViewer extends StatelessWidget {
  final String description;
  const MarkdownViewer({
    Key? key,
    required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Html(
      data:description,
      style: {
        "figcaption": Style(
          display: Display.none,
        ),
        "img": Style(
          margin: Margins.all(0),
          // Adjust margin as needed
          width: Width(300), // Set a fixed width for the image
          height: Height(200), // Set a fixed height for the image
          display:
              Display.block, // Ensure the image is displayed as a block element
          textAlign: TextAlign.start, // Center the image
        ),
        "pre": Style(
          border: Border.all(color: Colors.white),
          padding: HtmlPaddings.all(10),
          backgroundColor:
              Color(0xff0d121b), // Set image height, adjust as needed
        ),
      },
    );
  }
}
