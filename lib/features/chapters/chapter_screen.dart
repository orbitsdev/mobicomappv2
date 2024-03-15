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
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text("Chapter Overview"),
        children: [
          MardownViewer(description: widget.chapter?.description ?? ''),
        ],
      ),
    );
  }

  Widget buildLessonList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text("Lessons"),
        children: [
          Obx(
            ()=> chapterController.isLessonLoading.value ? CircularProgressIndicator(): SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: chapterController.lessons.length,
                  separatorBuilder: (context, index) => Divider(color: Colors.grey), // Add separator between lessons
                  itemBuilder: (context, index) {
                    Lesson lesson = chapterController.lessons[index];
                    return ListTile(
                      onTap: () => Get.to(()=>LessonScreen(lesson:chapterController.lessons[index])),
                      leading: Text('Lesson:${lesson.lesson_number}'),
                      title: Text('${lesson.title}'),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111827),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(widget.chapter?.title ?? ''),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: widget.chapter?.image_path != null
                  ? Image.network(
                      widget.chapter!.image_path!,
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat,
                    )
                  : null,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                buildChapterOverview(),
                buildLessonList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

