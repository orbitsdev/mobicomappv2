// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:mobicom/constant/image_constant.dart';
import 'package:mobicom/features/chapters/components/custom_icon_button.dart';
import 'package:mobicom/features/chapters/components/custom_image_view.dart';
import 'package:mobicom/models/chapter.dart';
import 'package:mobicom/theme/app_decoration.dart';
import 'package:mobicom/theme/theme_helper.dart';

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
          CustomImageView(
            imagePath: ImageConstant.imgPlaylistBackground,
            height: 181,
            radius: BorderRadius.circular(
              8,
            ),
            alignment: Alignment.center,
            onTap: () {
              // onTapImgRenaissance!.call();
            },
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 181,
              width: 342,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     left: 16,
                  //     top: 21,
                  //   ),
                  //   child: CustomIconButton(
                  //     height: 40,
                  //     width: 40,
                  //     padding: EdgeInsets.all(8),
                  //     alignment: Alignment.topLeft,
                  //     child: Icon(Icons.local_fire_department_sharp, color: Colors.red, size: 34,),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: AppDecoration.gradientBlackToBlack.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderBL8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 86,
                              bottom: 4,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "${chapter.title}",
                                  style: theme.textTheme.headlineSmall,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 6),

                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: CustomIconButton(
                              height: 50,
                              width: 50,
                              child: Text('24 Lessons',textAlign: TextAlign.center,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
