import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobicom/models/chapter.dart';
import 'package:shimmer/shimmer.dart';

class CustomeCardv2 extends StatelessWidget {
  final Chapter chapter;

  const CustomeCardv2({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final Gradient gradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF0B1C37).withOpacity(0.85), // Dark blue color with opacity
    Colors.transparent,
  ],
);


    return ClipRRect(
      borderRadius: BorderRadius.circular(12), // Adjust the border radius as needed
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
            height: 181,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: chapter.image_path!,
            placeholder: (context, url) => Shimmer.fromColors(
              child: Container(
                height: 181,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
            ),
            errorWidget: (context, url, error) => Image.asset(
              'assets/images/placeholder.png',
              height: 181,
              width: double.infinity,
              fit: BoxFit.cover,
              // color:  Colors.black, // Provide a default color if not provided
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Text(
              "Chapter ${chapter.number}".toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Adjust text color here
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${chapter.title}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Adjust text color here
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.play_arrow, color: Colors.white),
                    Text(
                      "${chapter.total_lessons} Lessons",
                      style: TextStyle(
                        color: Colors.white, // Adjust text color here
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
