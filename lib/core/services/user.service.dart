import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:antpack_users/core/models/item.model.dart';
import 'package:antpack_users/core/models/user.model.dart';

class FetchUsers {
  Future<List<List<Item>>> fetchUsers() async {
    late List<User> auxListUsers = [];
    late List<List<Item>> listUsers = [];
    late String response = '';

    try {
      final res = await http
          .get(
            Uri.parse('https://jsonplaceholder.typicode.com/users'),
          )
          .timeout(const Duration(seconds: 20));

      if (res.statusCode == 200) {
        response = res.body;
      } else {
        return [];
      }
    } catch (e) {
      response = await rootBundle.loadString('assets/Users.json');
    }
    auxListUsers = userFromJson(response);
    for (var i = 0; i < auxListUsers.length; i++) {
      final List<Item> auxItem = [];
      auxItem.add(itemFromJson(
          '{"text": "${auxListUsers[i].name}", "label": "Name", "img": null}'));
      auxItem.add(itemFromJson(
          '{"text": "${auxListUsers[i].email}", "label": "Email", "img": null}'));
      auxItem.add(itemFromJson(
          '{"text": "${auxListUsers[i].address.city}", "label": "City", "img": null}'));
      auxItem.add(itemFromJson(
          '{"text": "${auxListUsers[i].company.name}", "label": "Company name", "img": null}'));
      listUsers.add(auxItem);
    }

    return listUsers;
  }
}
