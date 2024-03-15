import 'package:flutter/material.dart';
import 'package:mobicom/models/lesson.dart';
import 'package:mobicom/widgets/mardown_viewer.dart';
import 'package:mobicom/widgets/VideoViewer.dart';
import 'package:video_player/video_player.dart';

class LessonScreen extends StatefulWidget {
  final Lesson? lesson;

  const LessonScreen({
    Key? key,
    this.lesson,
  }) : super(key: key);

  static String name = '/lessons';

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.lesson?.title}'),
      ),
      body: Column(
        children: [
          if (widget.lesson?.video_path != null)
            Expanded(
              child: Stack(
                children: [

                VideoViewer(path: widget.lesson!.video_path!)
                 
                ],
              ),
            ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Text(
                        'Lesson ${widget.lesson?.lesson_number}: ${widget.lesson?.title}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      if (widget.lesson?.image_path != null)
                        Image.network(widget.lesson!.image_path!),
                      SizedBox(height: 16),
                      MardownViewer(description: widget.lesson?.content ?? ''),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
