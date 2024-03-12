import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String name = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  String? _sectionValue; // Initialize section value
  List<String> _sectionOptions = []; // List to store section options

  @override
  void initState() {
    super.initState();
    _fetchSections(); // Fetch sections when the screen initializes
  }

  Future<void> _fetchSections() async {
    final response = await http.get(Uri.parse('http://157.245.61.45/api/sections'));
    if (response.statusCode == 200) {
      // If the server returns a successful response, parse the JSON
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> sections = data['data']['data'];
      setState(() {
        // Update the _sectionOptions list with the fetched sections
        _sectionOptions = sections.map<String>((section) => section['title']).toList();
      });
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception or display an error message.
      throw Exception('Failed to load sections');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
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
              FormBuilderTextField(
                name: 'password',
                decoration: const InputDecoration(labelText: 'Password'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                obscureText: true,
              ),
              DropdownButtonFormField<String>(
                value: _sectionValue,
                items: _sectionOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.saveAndValidate()) {
      var formData = _formKey.currentState!.value;
      print(formData['first_name']);
      print('Section selected: $_sectionValue');
    } else {
      print('Form validation failed!');
    }
  }
}
