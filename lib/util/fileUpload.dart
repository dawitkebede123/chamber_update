import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<bool> uploadlogoFile(File file,String name) async {
  final storageRef = FirebaseStorage.instance.ref().child('logo/$name'); // Replace with your desired path and filename

  final uploadTask = storageRef.putFile(file);

  // Optional: Track upload progress
  final snapshot = await uploadTask.snapshotEvents.firstWhere((event) =>
      event.state == TaskState.success); // Wait for upload completion

  final downloadUrl = await snapshot.ref.getDownloadURL();
  print('File uploaded successfully! Download URL: $downloadUrl');
 
  // Handle potential upload errors (optional)
  uploadTask.catchError((error) => print('Error uploading file: $error'));
  return true;
}
Future<bool> uploadimageFile(File file,String name) async {
  final storageRef = FirebaseStorage.instance.ref().child('image/$name'); // Replace with your desired path and filename

  final uploadTask = storageRef.putFile(file);

  // Optional: Track upload progress
  final snapshot = await uploadTask.snapshotEvents.firstWhere((event) =>
      event.state == TaskState.success); // Wait for upload completion

  final downloadUrl = await snapshot.ref.getDownloadURL();
  print('File uploaded successfully! Download URL: $downloadUrl');
 
  // Handle potential upload errors (optional)
  uploadTask.catchError((error) => print('Error uploading file: $error'));
  return true;
}

Future<bool> uploadvideoFile(File file,String name) async {
  final storageRef = FirebaseStorage.instance.ref().child('video/$name'); // Replace with your desired path and filename

  final uploadTask = storageRef.putFile(file);

  // Optional: Track upload progress
  final snapshot = await uploadTask.snapshotEvents.firstWhere((event) =>
      event.state == TaskState.success); // Wait for upload completion

  final downloadUrl = await snapshot.ref.getDownloadURL();
  print('File uploaded successfully! Download URL: $downloadUrl');
 
  // Handle potential upload errors (optional)
  uploadTask.catchError((error) => print('Error uploading file: $error'));
  return true;
}