
import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobicom/services/api.dart';
import 'package:http/http.dart' as http;

class SectionController  extends GetxController{  

  List<Map<String, dynamic>> sectionOptions = []; // List to store section options


  // Future<void> fetchSections() async {
  //   final response = await http.get(Uri.parse(Api.sections));
  //   if (response.statusCode == 200) {
  //     // If the server returns a successful response, parse the JSON
  //     final Map<String, dynamic> data = jsonDecode(response.body);
  //     final List<dynamic> sections = data['data']['data'];
     
  //       sectionOptions = sections.map<Map<String,dynamic>>((section) => section as Map<String ,dynamic> ).toList();
  //       sectionOptions.forEach((element) { 
  //         print(element);
  //       });
  //     // setState(() {
  //     //   // Update the _sectionOptions list with the fetched sections
  //     // });
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // throw an exception or display an error message.
  //     throw Exception('Failed to load sections');
  //   }
  // }

 }