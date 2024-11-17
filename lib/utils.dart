// ignore_for_file: constant_identifier_names
import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class Utils {
static const kAPI_KEY = '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';

static appBottomSheet(BuildContext context,
    {EdgeInsetsGeometry? padding, required Widget body}){
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
          width: double.infinity,
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: const BoxDecoration(
              color:
                  Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15))),
          child: body));
}

  static Future<File?> pickImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final XFile? xfile = await picker.pickImage(source: imageSource);
    if (xfile == null) {
      return null;
    } else {
      return File(xfile.path);
    }
  }

  static Future<String> processImageToBase64(File file) async{
    final bytes = await file.readAsBytes();
    final base64String = base64Encode(bytes);
    return base64String;
  }
}