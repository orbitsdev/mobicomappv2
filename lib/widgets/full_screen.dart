import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black for full-screen effect
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Center(
          child: Hero(
            tag: imageUrl, // Unique tag for hero animation
            child: CachedNetworkImage( // Use CachedNetworkImage instead of Image.network
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(), // Placeholder while loading
              errorWidget: (context, url, error) => Icon(Icons.error), // Error widget if loading fails
            ),
          ),
        ),
      ),
    );
  }
}
