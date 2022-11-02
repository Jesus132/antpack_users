import 'package:flutter/material.dart';

import 'package:antpack_users/core/widgets/image.dart';
import 'package:antpack_users/core/models/item.model.dart';
import 'package:image_picker/image_picker.dart';

class CardItem extends StatelessWidget {
  final List<Item> users;

  const CardItem({Key? key, required this.users}) : super(key: key);

  void setImages(XFile? img) {
    users[0].img = img;
  }

  List<Widget> columnList() {
    final List<Widget> column = [];
    for (var i = 0; i < users.length; i++) {
      column.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${users[i].label}:',
            style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(users[i].text),
        ],
      ));
      column.add(const SizedBox(
        height: 15.0,
      ));
    }
    return column;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...columnList(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Img(
                  setImage: setImages,
                  img: users[0].img,
                ),
              ],
            ),
          ],
        ));
  }
}
