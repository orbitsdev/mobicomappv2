import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:mobicom/constant/typdef.dart';
import 'package:mobicom/modals/dialogs.dart';
import 'package:mobicom/models/chapter.dart';
import 'package:http/http.dart' as http;
import 'package:mobicom/services/api.dart';

class ChapterController extends GetxController {
  var chapters = <Chapter>[];

  EitherModel<String?> fetchChapter(BuildContext context) async {
  try {
 

    var response = await http.get(Uri.parse(Api.chapters));
    var responseData = jsonDecode(response.body);

    if (responseData['success']) {
      var data = responseData['data']['data']; // Extracting the chapters array from the response
      chapters = data.map((chapterData) => Chapter.fromMap(chapterData)).toList();
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

}
