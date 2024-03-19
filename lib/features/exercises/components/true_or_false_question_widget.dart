import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobicom/models/true_or_false_question.dart';

class TrueOrFalseQuestionWidget extends StatelessWidget {
  final TrueOrFalseQuestion question;
  final int index;

  TrueOrFalseQuestionWidget({
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
        FormBuilderRadioGroup(
          name: 'question_$index',
          options: [
            FormBuilderFieldOption(value: 'True'),
            FormBuilderFieldOption(value: 'False'),
          ],
          validator: FormBuilderValidators.required(),
        ),
      ],
    );
  }
}