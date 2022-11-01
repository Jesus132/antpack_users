import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:antpack_users/core/widgets/card-list.dart';
import 'package:antpack_users/core/widgets/card-item.dart';
import 'package:antpack_users/core/models/item.model.dart';
import 'package:antpack_users/core/services/user.service.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UserPage();
  }
}

class _UserPage extends State<UserPage> {
  late XFile? imageFile;

  _UserPage();

  late List<List<Item>> listUsers = [];

  @override
  void initState() {
    get();
    // onGalery();
  }

  void get() async {
    listUsers = await FetchUsers().fetchUsers();
    setState(() {});
  }

  void onGalery() async {
    final ImagePicker _picker = ImagePicker();
    imageFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  void onCamera() async {
    final ImagePicker _picker = ImagePicker();
    imageFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      cacheExtent: 0,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      itemCount: listUsers.length,
      itemBuilder: (context, index) => AnimatedScrollViewItem(
        child: CardItem(users: listUsers[index]),
      ),
    );
  }
}


// // Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: <Widget>[
// //         ListView.builder(
// //           cacheExtent: 0,
// //           padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
// //           itemCount: listUsers.length,
// //           itemBuilder: (context, index) => AnimatedScrollViewItem(
// //             child: CardItem(users: listUsers[index]),
// //           ),
// //         )
// //       ],
// //     )