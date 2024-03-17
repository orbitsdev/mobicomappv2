import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/auth_controller.dart';

class UserInfoWidget extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: authController.user.value.image ?? '',
          imageBuilder: (context, imageProvider) => CircleAvatar(
            radius: 40,
            backgroundImage: imageProvider,
          ),
          placeholder: (context, url) => CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          errorWidget: (context, url, error) => CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          '${authController.user.value.full_name}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '${authController.user.value.email}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Section: ${authController.user.value.section ?? 'Not available'}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Teacher: ${authController.user.value.teacher_full_name ?? 'Not available'}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
