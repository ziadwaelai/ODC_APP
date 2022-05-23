import 'package:flutter/material.dart';
import 'package:odc_app/shared/styles/fontStyles.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          CircleAvatar(
            radius: 45,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Ziad Wael",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 201, 201, 201),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Center(
                child: Text(
              "Ziadwae142@gmail.com",
              style: TextStyle(color: Color.fromARGB(255, 130, 130, 130)),
            )),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "My Achievement",
              style: homeTitlsStyle,
            ),
          ),
        ]),
      ),
    );
  }
}
