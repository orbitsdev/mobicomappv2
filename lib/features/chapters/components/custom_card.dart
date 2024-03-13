// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobicom/data/sample_chapter.dart';
import 'package:shimmer/shimmer.dart';

import 'package:mobicom/models/chapter.dart';

class CustomCard extends StatelessWidget {

  final Chapter chapter;
  const CustomCard({
    Key? key,
    required this.chapter,
  }) : super(key: key);


  @override
  Widget build(BuildContext context){
    return Container(
    
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                Image.network(
                  '${getRandomImage()}',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                ),
              ),
            ),
          ),
    
             Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(1)],
                ),
              ),
            ),
            ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${chapter.title}',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${chapter.description}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
