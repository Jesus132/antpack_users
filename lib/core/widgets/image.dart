import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Img extends StatefulWidget {
  final ValueChanged<XFile> setImage;
  late XFile? img;

  Img({Key? key, required this.setImage, this.img}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Img(setImage: setImage, img: img);
  }
}

class _Img extends State<Img> {
  final ValueChanged<XFile> setImage;
  late XFile? img;
  XFile? imageFile;

  _Img({required this.setImage, this.img});

  @override
  void initState() {}

  void onGallary() async {
    final ImagePicker _picker = ImagePicker();
    img = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      setImage(img!);
    });
  }

  void onCamera() async {
    final ImagePicker _picker = ImagePicker();
    img = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      setImage(img!);
    });
  }

  void onDialogs(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        // title: Text(''),
        elevation: 24.0,
        content: SingleChildScrollView(
            child: ListBody(
          children: [
            ElevatedButton.icon(
              label: const Text(''),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              onPressed: () => onCamera(),
              icon: const Icon(Icons.camera_alt_outlined),
            ),
            ElevatedButton.icon(
              label: const Text(''),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              onPressed: () => onGallary(),
              icon: const Icon(Icons.file_open),
            ),
          ],
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        img == null
            ? InkWell(
                onTap: () => onDialogs(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/images.png',
                    width: 110.0,
                    height: 110.0,
                  ),
                ),
              )
            : InkWell(
                onTap: () => onDialogs(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.file(
                    File(img!.path),
                    fit: BoxFit.cover,
                    width: 180.0,
                    height: 180.0,
                  ),
                ),
              ),
      ],
    );
  }
}
