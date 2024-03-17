import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobicom/constant/typdef.dart';
import 'package:mobicom/controllers/chapter_controller.dart';
import 'package:mobicom/features/chapters/lesson_screen.dart';
import 'package:mobicom/models/chapter.dart';
import 'package:mobicom/models/lesson.dart';
import 'package:mobicom/widgets/full_screen.dart';
import 'package:mobicom/widgets/mardown_viewer.dart';
import 'package:shimmer/shimmer.dart';

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
          MarkdownViewer(description: widget.chapter?.description ?? ''),
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Text(
                                  'Lesson ${lesson.lesson_number}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                  ? GestureDetector(
                    onTap: ()=>  Get.to(()=>FullScreenImage(imageUrl: widget.chapter!.image_path!)),
                    child: CachedNetworkImage(
                        height: 181,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: widget.chapter!.image_path!,
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
