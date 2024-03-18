import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/controllers/section_controller.dart';
import 'package:http/http.dart' as http;
import 'package:mobicom/features/authentication/login_screen.dart';
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
  String? _sectionValue;
  List<Map<String, dynamic>> _sectionOptions = [];
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _fetchSections();
  }

  Future<void> _fetchSections() async {
    final response = await http.get(Uri.parse(Api.sections_production));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> sections = data['data']['data'];

      setState(() {
        _sectionOptions = sections
            .map<Map<String, dynamic>>(
                (section) => section as Map<String, dynamic>)
            .toList();
      });
    } else {
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
                decoration:  InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              SizedBox(height: 10),
              FormBuilderTextField(
                name: 'last_name',
                decoration:  InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              SizedBox(height: 10),
              FormBuilderTextField(
                name: 'email',
                decoration:  InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              SizedBox(height: 10),
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
                decoration: InputDecoration(
                  labelText: 'Section',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              FormBuilderTextField(
                name: 'password',
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),

                ]),
                obscureText: _isObscure,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _submit(context),
                  child: Text('Submit'),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigate to the login screen
                  Get.toNamed(LoginScreen.name);
                },
                child: Text(
                  'Already have an account? Login here',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
