// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:mobicom/constant/image_constant.dart';
import 'package:mobicom/features/chapters/components/custom_icon_button.dart';
import 'package:mobicom/features/chapters/components/custom_image_view.dart';
import 'package:mobicom/models/chapter.dart';
import 'package:mobicom/theme/app_decoration.dart';
import 'package:mobicom/theme/theme_helper.dart';
import 'package:shimmer/shimmer.dart';

class CustomeCardv2 extends StatelessWidget {

  final Chapter chapter;
  const CustomeCardv2({
    Key? key,
    required this.chapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
  return SizedBox(
  height: 181,
  width: MediaQuery.of(context).size.width,
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
      Positioned(
        top: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${chapter.title}",
                style: theme.textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.play_arrow, color: Colors.white),
                  Text(
                    "${chapter.total_lessons} Lessons",
                    style: theme.textTheme.subtitle1?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 300, // Adjust the height as needed
          padding: EdgeInsets.all(16),
          decoration: AppDecoration.gradientBlackToBlack.copyWith(
            borderRadius: BorderRadiusStyle.customBorderBL8,
          ),
        ),
      ),
    ],
  ),
);


  }
}
