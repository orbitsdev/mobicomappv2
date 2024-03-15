import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobicom/constant/typdef.dart';
import 'package:mobicom/controllers/chapter_controller.dart';
import 'package:mobicom/features/chapters/lesson_screen.dart';
import 'package:mobicom/models/chapter.dart';
import 'package:mobicom/models/lesson.dart';
import 'package:mobicom/widgets/mardown_viewer.dart';

class ChapterScreen extends StatefulWidget {
  final Chapter? chapter;

  const ChapterScreen({Key? key, this.chapter}) : super(key: key);

  static String name = '/chapter-details';

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  final ChapterController chapterController = Get.put(ChapterController());
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    fetchChapterLessons();
  }

  fetchChapterLessons() async {
    await chapterController.fetchChapterLessons(context, widget.chapter!.id);
  }

  Widget buildChapterOverview() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Chapter Overview",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          MardownViewer(description: widget.chapter?.description ?? ''),
        ],
      ),
    );
  }

  Widget buildLessonList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Lessons",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Obx(
            () => chapterController.isLessonLoading.value
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: chapterController.lessons.map((lesson) {
                      return GestureDetector(
                        onTap: () => Get.to(() => LessonScreen(lesson: lesson)),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Text(
                                  'Lesson ${lesson.lesson_number}',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    '${lesson.title}',
                                    style: TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> _refreshPage() async {
    // Add your refresh logic here, like fetching updated data
    await fetchChapterLessons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.chapter?.title ?? '',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshPage,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              widget.chapter?.image_path != null
                  ? Image.network(
                      widget.chapter!.image_path!,
                      fit: BoxFit.cover,
                    )
                  : Container(),
              buildChapterOverview(),
              buildLessonList(),
            ],
          ),
        ),
      ),
    );
  }
}
