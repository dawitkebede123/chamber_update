import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:gallery_picker/models/media_file.dart';

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

// Assuming you're using a package like 'gallery_picker'

Future<File?> getImageFromGallery(BuildContext context) async {
  // Request permission for photo library access
  await Permission.photos.request();

  // final status = await Permission.photos.request();
  // if (status != PermissionStatus.granted) {
  //   print('Permission denied for photo library access.');
  //   return null; // Indicate permission issue
  // }

  try {
    final singleMedia = await GalleryPicker.pickMedia(
      context: context,
      singleMedia: true, // Ensure single selection
    );
    if (singleMedia?.isEmpty == true) {
      print('No image selected.');
      return null; // Indicate no selection
    }
    return singleMedia?.first.getFile();
    // return await mediaFile.getFile();
  } catch (e) {
    print('Error picking image: $e');
    return null; // Handle potential exceptions
  }
}
