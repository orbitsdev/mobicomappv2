import 'package:flutter/material.dart';
import 'package:mobicom/models/lesson.dart';
import 'package:mobicom/slivers/sticker_header.dart';
import 'package:mobicom/widgets/VideoViewer.dart';
import 'package:mobicom/widgets/mardown_viewer.dart';

class LessonScreen extends StatelessWidget {
  final Lesson? lesson;

  const LessonScreen({
    Key? key,
    this.lesson,
  }) : super(key: key);

  static String name = '/lessons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
        if (lesson?.video_path != null)
            SliverPersistentHeader(
              delegate: StickyHeaderDelegate(
                minHeight: 200,
                maxHeight: 300,
                child: VideoViewer(path: lesson!.video_path!),
              ),
              pinned: true,
            ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Lesson ${lesson?.lesson_number}: ${lesson?.title}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    if (lesson?.image_path != null)
                      Image.network(
                        lesson!.image_path!,
                        fit: BoxFit.cover,
                      ),
                    SizedBox(height: 16),
                    MarkdownViewer(description: lesson?.content ?? ''),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
