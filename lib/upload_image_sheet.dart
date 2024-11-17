
import 'package:flutter/material.dart';
import 'package:flutter_chat/utils.dart';
import 'package:image_picker/image_picker.dart';

class SelectPhotoOptions extends StatefulWidget {
  SelectPhotoOptions({super.key, required this.holdBase64Image});
  void Function(String) holdBase64Image;
  @override
  State<SelectPhotoOptions> createState() => _SelectPhotoOptionsState();
}

class _SelectPhotoOptionsState extends State<SelectPhotoOptions> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Select upload option",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(height: 20),
                  clickOption(
                      icon: Icons.photo_camera_outlined,
                      text: "Take photo",
                      onTap: () {
                        Navigator.pop(context);
                        Utils.pickImage(ImageSource.camera).then((value) async {
                          if (value != null) {
                            String base64Image =
                            await Utils.processImageToBase64(value);
                            widget.holdBase64Image(base64Image);
                          }
                        });
                      }),
                  const SizedBox(height: 30),
                  clickOption(
                      icon: Icons.photo_library_outlined,
                      text: "Select from gallery",
                      onTap: () {
                        Navigator.pop(context);
                        Utils.pickImage(ImageSource.gallery)
                            .then((value) async {
                          if (value != null) {
                            String base64Image =
                                await Utils.processImageToBase64(value);
                            widget.holdBase64Image(base64Image);
                          }
                        });
                      }),
                  const SizedBox(height: 5)
                ])));
  }
}

InkWell clickOption(
    {required IconData icon,
    required String text,
    required VoidCallback onTap}) {
  return InkWell(
    child: Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 10),
        Text(text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
      ],
    ),
    onTap: () {
      onTap();
    },
  );
}
