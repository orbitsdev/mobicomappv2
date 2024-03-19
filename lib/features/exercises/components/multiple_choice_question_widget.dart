import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobicom/models/multiple_choice_question.dart';
class MultipleChoiceQuestionWidget extends StatelessWidget {
  final MultipleChoiceQuestion question;
  final int index;

  MultipleChoiceQuestionWidget({
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
          options: question.options!.map((option) => FormBuilderFieldOption(value: option)).toList(),
          validator: FormBuilderValidators.required(),
        ),
      ],
    );
  }
}