import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobicom/models/whole_result.dart';
import 'package:mobicom/widgets/mardown_viewer.dart';

class WholeResultScreen extends StatefulWidget {
  final WholeResult wholeresult;

  const WholeResultScreen({
    Key? key,
    required this.wholeresult,
  }) : super(key: key);

  @override
  _WholeResultScreenState createState() => _WholeResultScreenState();
}

class _WholeResultScreenState extends State<WholeResultScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MarkdownViewer(
                description: '${widget.wholeresult.exercise_description}'),
            SizedBox(height: 20),
            _buildSectionTitle('Exercise Details'),
            _buildInfoRow(
                'Exercise Name', '${widget.wholeresult.exercise_name}'),
            _buildInfoRow('Student Name', '${widget.wholeresult.student_name}'),
            _buildInfoRow(
                'Total Score', widget.wholeresult.total_score.toString()),
            _buildInfoRow('Total Questions',
                widget.wholeresult.total_questions.toString()),
            _buildInfoRow('Date', '${widget.wholeresult.created_at}'),
            SizedBox(height: 20),
            if (widget.wholeresult.feed != null) ...[
              _buildFeedbackSection(widget.wholeresult.feed!),
              SizedBox(height: 20),
            ],
            _buildSectionTitle('Answers'),
            ...widget.wholeresult.answers!.map((answer) {
              return _buildAnswerCard(answer);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
Widget _buildFeedbackSection(Feed feed) {
  // Define emojis and descriptions for ratings
  Map<int, String> ratingEmojis = {
    1: '😫', // Difficulty
    2: '😕', // Moderately difficult
    3: '😐', // Moderate
    4: '😊', // Moderately easy
    5: '🙂', // Easy
  };

  // Determine rating emoji and description
  String ratingEmoji = ratingEmojis[feed.rate ?? 3] ?? '😐'; // Default to moderate
  String ratingDescription = '';
  switch (feed.rate) {
    case 1:
      ratingDescription = 'Difficulty';
      break;
    case 2:
      ratingDescription = 'Moderately difficult';
      break;
    case 3:
      ratingDescription = 'Moderate';
      break;
    case 4:
      ratingDescription = 'Moderately easy';
      break;
    case 5:
      ratingDescription = 'Easy';
      break;
    default:
      ratingDescription = 'Moderate';
  }

  return Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      gradient: LinearGradient(
        colors: [Color(0xFF0050AC), Color(0xFF3E7BCE)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Feedback',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
         Divider(
      color: Colors.white,
      thickness: 2,
      indent: 20,
      endIndent: 20,
    ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ratingEmoji,
              style: TextStyle(fontSize: 38),
            ),
         
            // SizedBox(width: 16),
            // Column(
            //   children: [
            //     Text(
            //       'Rating:',
            //       style: TextStyle(fontSize: 18, color: Colors.white),
            //     ),
            //     SizedBox(height: 8),
            //     Container(
            //       width: 60,
            //       height: 60,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         border: Border.all(color: Colors.white, width: 2),
            //       ),
            //       child: Text(
            //         '${feed.rate ?? 'NONE'}',
            //         style: TextStyle(fontSize: 24, color: Colors.white),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),

           Center(
             child: Text(
                ratingDescription.toUpperCase(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
           ),
            Gap(10),
       Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
  decoration: BoxDecoration(
 
    gradient: LinearGradient(
      colors: [Color.fromARGB(175, 2, 85, 180), Color.fromARGB(255, 18, 95, 202)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  child: Text(
    '${feed.message ?? 'NONE'} ',
    style: TextStyle(fontSize: 14, color: Colors.white),
  ),
),

        // SizedBox(height: 16),
        // Container(
        //   margin: EdgeInsets.symmetric(vertical: 16),
        //   padding: EdgeInsets.all(16),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(12),
        //     border: Border.all(color: Colors.white, width: 2),
        //   ),
        //   child: Text(
        //     'Message: ${feed.message ?? 'NONE'}',
        //     style: TextStyle(fontSize: 18, color: Colors.white),
        //     textAlign: TextAlign.center,
        //   ),
        // ),
      ],
    ),
  );
}



  Widget _buildAnswerCard(Answer answer) {
    String? actualQuestion;
    String? correctAnswer;
    List<String>? options;

    // Determine the actual question, correct answer, and options based on the type of exercise
    if (answer.exercise_type == "Multiple Choice") {
      actualQuestion = answer.multiple_question_result?.question;
      correctAnswer = answer.multiple_question_result?.correct_answer;
      options = answer.multiple_question_result?.options;
    } else if (answer.exercise_type == "True or False") {
      actualQuestion = answer.true_or_false_question_result?.question;
      correctAnswer = answer.true_or_false_question_result?.correct_answer;
    } else if (answer.exercise_type == "Fill in the Blank") {
      actualQuestion = answer.fill_in_the_blank_result?.question;
      correctAnswer = answer.fill_in_the_blank_result?.correct_answer;
    }

    // Determine if the answer is correct
    bool isCorrect =
        answer.answer!.toLowerCase() == correctAnswer!.toLowerCase();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: isCorrect
              ? [Colors.green.withOpacity(0.1), Colors.green.withOpacity(0.05)]
              : [Colors.red.withOpacity(0.1), Colors.red.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
            color: isCorrect
                ? Colors.green.withOpacity(0.3)
                : Colors.red.withOpacity(0.3),
            width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.help_outline, // Change to your preferred icon
                  color: isCorrect ? Colors.green : Colors.red,
                ),
                SizedBox(width: 8),
                Text(
                  'Question ${answer.question_number ?? ''}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              actualQuestion ?? "",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (options != null && options.isNotEmpty) ...[
              SizedBox(height: 10),
              Text(
                'Options:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: options.map((option) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: [
                        Icon(Icons.circle, size: 8, color: Colors.white),
                        SizedBox(width: 5),
                        Expanded(
                            child: Text(
                          option,
                          style: TextStyle(fontSize: 12),
                        )),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isCorrect
                      ? [
                          Colors.green.withOpacity(0.3),
                          Colors.green.withOpacity(0.1)
                        ]
                      : [
                          Colors.red.withOpacity(0.3),
                          Colors.red.withOpacity(0.1)
                        ],
                ),
                border: Border.all(
                  color: isCorrect
                      ? Colors.blue.withOpacity(0.2)
                      : Colors.red.withOpacity(0.2),
                  width: 2,
                ),
              ),
              child: Row(
                // Using Row instead of Column to include the icon
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    isCorrect ? Icons.check_circle : Icons.cancel,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                  SizedBox(width: 8), // Adjust as needed
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Your Answer',
                        style: TextStyle(
                          fontWeight: FontWeight.w600, // Changed to semi-bold
                          fontSize: 12,
                          color: isCorrect ? Colors.green : Colors.red,
                        ),
                      ),
                      SizedBox(height: 4), // Adjust as needed
                      Text(
                        answer.answer ?? "",
                        style: TextStyle(
                          fontSize: 12,
                          color: isCorrect ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(10),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.1)
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(),
                  Text(
                    'Actual Answer',
                    style: TextStyle(
                      fontWeight: FontWeight.w600, // Changed to semi-bold
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4), // Adjust as needed
                  Text(
                    correctAnswer ?? "",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerRow(String label, String value, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
