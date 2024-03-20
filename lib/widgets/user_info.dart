import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:mobicom/controllers/auth_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobicom/controllers/auth_controller.dart';

class UserInfoWidget extends StatelessWidget {
  final authController = Get.find<AuthController>();
// final ImagePicker _imagePicker = ImagePicker(); 
File? image;

   
Future<void> _showImagePickerBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () async {
                                Get.back(); // Close bottom sheet

                // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                // if (image != null) {
                //   // Call function to upload profile image
                //   await authController.uploadProfileImage(context, File(image.path));
                // }
                // Get.back(); // Close bottom sheet
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () async {
                // final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                // if (image != null) {
                //   // Call function to upload profile image
                //   await authController.uploadProfileImage(context, File(image.path));
                // }
                Get.back(); // Close bottom sheet
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        
        GestureDetector(
          onTap: ()=>_showImagePickerBottomSheet(context),
          child: CachedNetworkImage(
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
