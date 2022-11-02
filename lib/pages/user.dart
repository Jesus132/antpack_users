import 'package:flutter/material.dart';

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
  _UserPage();

  late List<List<Item>> listUsers = [];

  @override
  void initState() {
    get();
  }

  void get() async {
    listUsers = await FetchUsers().fetchUsers();
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
