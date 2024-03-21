import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobicom/controllers/auth_controller.dart';

class UserInfoWidget extends StatelessWidget {
  final authController = Get.find<AuthController>();
  final ImagePicker _imagePicker = ImagePicker();
  File? image;

  Future<void> _uploadProfileImage(BuildContext context) async {
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

                final XFile? imageFile = await _imagePicker.pickImage(source: ImageSource.gallery);
                if (imageFile != null) {
                  // Pass the user ID here
                  await authController.uploadProfileImage(File(imageFile.path));
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () async {
               Get.back(); // Close bottom sheet

                final XFile? imageFile = await _imagePicker.pickImage(source: ImageSource.camera);
                if (imageFile != null) {
                  // Pass the user ID here
                  await authController.uploadProfileImage(File(imageFile.path));
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(20),
  Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2, // Set border width
        ),
      ),
      child: Obx(
        ()=> GestureDetector(
          onTap: () => _uploadProfileImage(context),
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
      ),
    ),
    Gap(10),
   Text(
        '${authController.user.value.full_name} Maria tressa Smasom',
        textAlign: TextAlign.center, // Center the text horizontally
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
  ],
),

      ListTile(
        leading: Icon(Icons.email, color: Colors.white),
        title: Text(
          '${authController.user.value.email}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.business, color: Colors.white),
        title: Text(
          'Section: ${authController.user.value.section ?? 'Not available'}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.person_outline, color: Colors.white),
        title: Text(
          'Teacher: ${authController.user.value.teacher_full_name ?? 'Not available'}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
        ],
      ),
    );
  }
}
