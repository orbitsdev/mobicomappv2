import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/controllers/section_controller.dart';
import 'package:http/http.dart' as http;
import 'package:mobicom/services/api.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String name = "/register";
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var auth_controller = Get.find<AuthController>();
  var sectioncontroller = Get.find<SectionController>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  String? _sectionValue; // Initialize section value
  List<Map<String, dynamic>> _sectionOptions =
      []; // List to store section options

  @override
  void initState() {
    super.initState();
    // sectioncontroller.fetchSections();

    _fetchSections(); // Fetch sections when the screen initializes
  }

  Future<void> _fetchSections() async {
    final response = await http.get(Uri.parse(Api.sections));
    if (response.statusCode == 200) {
      // If the server returns a successful response, parse the JSON
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> sections = data['data']['data'];

      setState(() {
        // Update the _sectionOptions list with the fetched sections
        _sectionOptions = sections
            .map<Map<String, dynamic>>(
                (section) => section as Map<String, dynamic>)
            .toList();
      });
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception or display an error message.
      throw Exception('Failed to load sections');
    }
  }

  void _submit(BuildContext context) async {
   
    if (_formKey.currentState!.saveAndValidate()) {
      Map<String, dynamic> formData = Map.from(_formKey.currentState!.value);
      formData['enrolled_section_id'] = _sectionValue;

      await auth_controller.register(context, formData);

    } else {
      print('Form validation failed!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Screen'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'first_name',
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              FormBuilderTextField(
                name: 'last_name',
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              DropdownButtonFormField<String>(
                value: _sectionValue,
                items: _sectionOptions.map((Map<String, dynamic> section) {
                  return DropdownMenuItem<String>(
                    value: section['id'].toString(),
                    child: Text('${section['title']}'),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _sectionValue = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Section'),
              ),
              SizedBox(height: 20),
              FormBuilderTextField(
                name: 'password',
                decoration: const InputDecoration(labelText: 'Password'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () => _submit(context),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
