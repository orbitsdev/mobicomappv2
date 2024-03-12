import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/features/authentication/login_screen.dart';

class AuthMiddleware  extends GetMiddleware{
  @override 
  int? get priority => 1;

  bool isAuthenticated = false;
  @override
  RouteSettings? redirect(String? route){
    if(!isAuthenticated){
      return RouteSettings(name: LoginScreen.name);
    }
  }

}