import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/chapter_controller.dart';
import 'package:mobicom/features/chapters/components/custome_cardv2.dart';
import 'package:mobicom/features/chapters/lessson_screen.dart';

class ChapterPage extends StatefulWidget {
  const ChapterPage({Key? key}) : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  final ChapterController chapterController = Get.find<ChapterController>();

  @override
  void initState() {
    super.initState();
    getChapters();
  }

  Future<void> getChapters() async {
    await chapterController.fetchChapter(context);
  }

  Future<void> _refreshChapters() async {
    await chapterController.fetchChapter(context);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: _refreshChapters,
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(height: 24),
          itemCount: chapterController.chapters.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => Get.to(() => LesssonScreen(),
                arguments: {'chapter': chapterController.chapters[index]}),
            child: CustomeCardv2(chapter: chapterController.chapters[index]),
          ),
        ),
      ),
    );
  }
}
