import 'package:flutter/material.dart';

import '../../shared/styles/colorsStyle.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout))
        ],
        automaticallyImplyLeading: false,
        title: Text(
          "My Profile",
          style: TextStyle(
              color: defColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
