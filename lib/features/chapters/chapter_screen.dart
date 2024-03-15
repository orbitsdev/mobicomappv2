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
      backgroundColor: Color(0xff111827),
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
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: Text("Chapter Overview"),
                      children: [
                         Html(
                                          data: chapter.description ?? '',
                        style: {
                          "figcaption": Style(
                            display: Display.none,
                          ),
                          "img": Style(
                            margin: Margins.all(0),
                            // Adjust margin as needed
                            width: Width(300), // Set a fixed width for the image
                            height:
                                Height(200), // Set a fixed height for the image
                            display: Display
                                .block, // Ensure the image is displayed as a block element
                            textAlign: TextAlign.start, // Center the image
                          ),
                          "pre": Style(
                            border: Border.all(color: Colors.white),
                            padding: HtmlPaddings.all(10),
                            backgroundColor: Color(
                                0xff0d121b), // Set image height, adjust as needed
                          ),
                        },
                        
                      )
                      ],
                    ),
                  ),
                  // Render lesson titles
                 ...chapterController.lessons.map((lesson) => ListTile(
  leading: lesson.image_path != null ? Image.network(lesson.image_path!) : null,
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
