import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:mobicom/controllers/section_controller.dart';
import 'package:mobicom/features/authentication/register_screen.dart';
import 'package:mobicom/services/api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String name = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var auth_controller = Get.find<AuthController>();
  var sectioncontroller = Get.find<SectionController>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  

  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
   }

  

  void _submit(BuildContext context) async {
    if (_formKey.currentState!.saveAndValidate()) {
      final formData = Map<String, dynamic>.from(_formKey.currentState!.value);
      // formData['enrolled_section_id'] = _sectionValue;
      await auth_controller.login(context, formData);
    } else {
      print('Form validation failed!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            // Your logo
            // Image.asset(
            //   'assets/logo.png', // Replace 'assets/logo.png' with your logo image path
            //   height: 100, // Adjust height as needed
            // ),
              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              SizedBox(height: 20),
              FormBuilderTextField(
                name: 'password',
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
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
                width: double.infinity, // Set width to match the parent width
                child: ElevatedButton(
                  onPressed: () => _submit(context),
                  child: Text('LOGIN'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(()=>RegisterScreen()); 
                },
                child: Text(
                  'Don\'t have an account? Register here',
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
