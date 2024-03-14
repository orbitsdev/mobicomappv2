import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/chapter_controller.dart';
import 'package:mobicom/models/chapter.dart';
import 'package:mobicom/models/lesson.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({Key? key}) : super(key: key);
  static String name = '/chapter-details';

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  late ChapterController chapterController;
  late Chapter chapter;

  @override
  void initState() {
    super.initState();
    chapterController = Get.find<ChapterController>();
    chapter = Get.arguments['chapter'] as Chapter;
    fetchLesson(chapter.id);
  }

  void fetchLesson(chapterId) async {
    await chapterController.fetchChapterLessons(context, chapterId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(chapter.title ?? ''),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: chapter.image_path != null
                  ? Image.network(
                      chapter.image_path!,
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          Obx(
            () => SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Render HTML content for chapter description
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Html(
                      data: chapter.description ?? '',
                      style: {
                        "img": Style(
                          margin: Margins.symmetric(
                              vertical: 10.0), // Adjust margin as needed
                          width: Width(
                              MediaQuery.of(context).size.width), // Set image width to screen width
                          height: Height(200), // Set image height, adjust as needed
                        ),
                      },
                    ),
                  ),
                  // Render lesson titles
                  ...chapterController.lessons.map((lesson) => ListTile(
                        title: Text('${lesson.title}'),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
