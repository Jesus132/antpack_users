// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    required this.label,
    required this.text,
    this.img,
  });

  String label;
  String text;
  XFile? img;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        label: json["label"],
        text: json["text"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "text": text,
        "img": img,
      };
}
