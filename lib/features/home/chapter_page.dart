import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobicom/data/sample_chapter.dart';
import 'package:mobicom/features/chapters/components/custom_card.dart';
import 'package:mobicom/features/chapters/components/custome_cardv2.dart';
import 'package:mobicom/features/chapters/lessson_screen.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return ListView.separated(

        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 24);
        },
        itemCount: sample_chapters.length,
        itemBuilder: (context, index) {

          return GestureDetector(
            onTap: ()=> Get.to(()=> LesssonScreen(), arguments: {'chapter': sample_chapters[index]} ),
            child: CustomeCardv2(chapter:sample_chapters[index],));

        });
  }
}
