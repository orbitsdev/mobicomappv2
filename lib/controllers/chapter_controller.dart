import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:mobicom/constant/typdef.dart';
import 'package:mobicom/modals/dialogs.dart';
import 'package:mobicom/models/chapter.dart';
import 'package:http/http.dart' as http;
import 'package:mobicom/models/lesson.dart';
import 'package:mobicom/services/api.dart';

  class ChapterController extends GetxController {

    var chapters = <Chapter>[].obs; // Change to non-nullable list
    var lessons = <Lesson>[].obs;
    var isLessonLoading = false.obs;
   // Change to non-nullable list

  EitherModel<String?> fetchChapter(BuildContext context) async {
    try {
      var response = await http.get(Uri.parse(Api.chapters));
      var responseData = jsonDecode(response.body);

      if (responseData['success']) {
        var data = responseData['data']['data'] as List<dynamic>; // Extracting the chapters array from the response
      List<Chapter> new_data = (data.map((e) => Chapter.fromMap(e as Map<String, dynamic>) )).toList();
      chapters(new_data);

     

        return right('Data fetched successfully'); // Returning a success message
      } else {
        Dialogs.showErrorDialog(context, 'Something went wrong');
        return left('Something went wrong'); // Returning an error message
      }
    } on SocketException catch (e) {
      Dialogs.showErrorDialog(context, e.message);
      return left('No internet connection');
    } catch (e) {
      Dialogs.showErrorDialog(context, e.toString());
      return left(e.toString());
    }
  }

    EitherModel<String?>  fetchChapterLessons(BuildContext context, chapterId) async {
       
        
   

  
    isLessonLoading(true);
    try {
      var response = await http.get(Uri.parse(Api.chapter_lessons + "?chapter_id=${chapterId}"));
      var responseData = jsonDecode(response.body);

      if (responseData['success']) {
           var data = responseData['data']['data'] as List<dynamic>; // Extracting the chapters array from the response
      List<Lesson> new_data = (data.map((e) => Lesson.fromMap(e as Map<String, dynamic>) )).toList();
      lessons(new_data);


        


        
        isLessonLoading(false);
        return right('Data fetched successfully');
      } else {
        isLessonLoading(false);
        Dialogs.showErrorDialog(context, 'Something went wrong');
        return left('Something went wrong');
      }
    } on SocketException catch (e) {
      isLessonLoading(false);
      Dialogs.showErrorDialog(context, e.message);
      return left('No internet connection');
    } catch (e) {
      isLessonLoading(false);
      Dialogs.showErrorDialog(context, e.toString());
      return left(e.toString());
    }
  
  }

}
