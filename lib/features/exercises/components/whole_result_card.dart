import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/result_controller.dart';
import 'package:mobicom/features/exercises/answer_screen.dart';
import 'package:mobicom/features/results/whole_result_screen.dart';
import 'package:mobicom/models/whole_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mobicom/features/results/whole_result_screen.dart';
import 'package:mobicom/models/whole_result.dart';


class WholeResultCard extends StatefulWidget {
  final WholeResult wholeResult;

  const WholeResultCard({Key? key, required this.wholeResult}) : super(key: key);

  @override
  _WholeResultCardState createState() => _WholeResultCardState();
}

class _WholeResultCardState extends State<WholeResultCard> {
  var resultcontroller = Get.find<ResultController>();
  double _rating = 0;
  IconData _difficultyIcon = Icons.sentiment_neutral;
  TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.wholeResult.exercise_name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headline6?.color,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Exercise Type: ${widget.wholeResult.exercise_type}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Total Questions & Score: ${widget.wholeResult.total_questions} / ${widget.wholeResult.total_score}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Date: ${widget.wholeResult.created_at}',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => WholeResultScreen(wholeresult: widget.wholeResult));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                  child: Text(
                    'View More Details',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                widget.wholeResult.feed == null? ElevatedButton(
                  onPressed: () {
                    _showRatingDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade700,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                  child: Text(
                    'Rate Difficulty',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ): Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Rate Difficulty"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Rate the difficulty of the exam:"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Rating: ${_rating.toInt()}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  RatingBar.builder(
                    initialRating: _rating,
                    minRating: 0,
                    maxRating: 5,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 40,
                    itemBuilder: (context, _) => Icon(
                      _difficultyIcon,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _rating = rating;
                        switch (_rating.toInt()) {
                          case 1:
                            _difficultyIcon = Icons.sentiment_very_satisfied;
                            break;
                          case 2:
                            _difficultyIcon = Icons.sentiment_satisfied;
                            break;
                          case 3:
                            _difficultyIcon = Icons.sentiment_neutral;
                            break;
                          case 4:
                            _difficultyIcon = Icons.sentiment_dissatisfied;
                            break;
                          case 5:
                            _difficultyIcon = Icons.sentiment_very_dissatisfied;
                            break;
                          default:
                            _difficultyIcon = Icons.sentiment_neutral;
                        }
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _feedbackController,
                    decoration: InputDecoration(
                      labelText: 'Feedback Message',
                    ),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    resultcontroller.addFeedback(
                      
                      context,
                      widget.wholeResult.id.toString(),
                      _rating.toInt(),
                      _feedbackController.text,
                    );
                  },
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}