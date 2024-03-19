import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TestQuestionPage extends StatefulWidget {
  static String name ="/testquestion";
  @override
  _TestQuestionPageState createState() => _TestQuestionPageState();
}

class _TestQuestionPageState extends State<TestQuestionPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  // Sample questions
  final List<Map<String, dynamic>> sampleQuestions = [
    {
      'type': 'Multiple Choice',
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin', 'Madrid'],
    },
    {
      'type': 'True or False',
      'question': 'Is the sky blue?',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Questions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView.builder(
            itemCount: sampleQuestions.length,
            itemBuilder: (context, index) {
              final question = sampleQuestions[index];
              return _buildQuestionWidget(question);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _validateAndSubmit,
        child: Icon(Icons.check),
      ),
    );
  }

  Widget _buildQuestionWidget(Map<String, dynamic> question) {
    final String type = question['type'];
    final String questionText = question['question'];
    final List<String>? options = question['options'];

    Widget questionWidget;
    switch (type) {
      case 'Multiple Choice':
        questionWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              questionText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FormBuilderRadioGroup(
              name: questionText,
              options: options!.map((option) => FormBuilderFieldOption(value: option)).toList(),
              validator: FormBuilderValidators.required( errorText: 'Please select an option'),
            ),
            SizedBox(height: 10),
          ],
        );
        break;
      case 'True or False':
        questionWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              questionText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FormBuilderRadioGroup(
              name: questionText,
              options: [
                FormBuilderFieldOption(value: 'True'),
                FormBuilderFieldOption(value: 'False'),
              ],
              validator: FormBuilderValidators.required( errorText: 'Please select True or False'),
            ),
            SizedBox(height: 10),
          ],
        );
        break;
      default:
        questionWidget = SizedBox(); // Return an empty widget for unsupported question types
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: questionWidget,
    );
  }

  void _validateAndSubmit() {
    if (_formKey.currentState!.saveAndValidate()) {
      // All answers are valid, handle submission
      Map<String, dynamic> formData = _formKey.currentState!.value;
      print('Form Data: $formData');
    } else {
      // Form validation failed, display error message
      print('Validation Error');
    }
  }
}
