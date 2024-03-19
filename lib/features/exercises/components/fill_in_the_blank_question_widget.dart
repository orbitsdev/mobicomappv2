import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobicom/models/fill_in_the_blank_question.dart';
class FillInTheBlankQuestionWidget extends StatelessWidget {
  final FillInTheBlankQuestion question;
  final int index;

  FillInTheBlankQuestionWidget({
    required this.question,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.question ?? '',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        FormBuilderTextField(
          name: 'question_$index',
          decoration: InputDecoration(labelText: 'Answer'),
          validator: FormBuilderValidators.required(),
        ),
      ],
    );
  }
}
