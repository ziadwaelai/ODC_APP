import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odc_app/modules/forgetPassword/VeifyEmail.dart';

import '../../shared/styles/CustomButtom.dart';
import '../../shared/styles/colorsStyle.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Forget Password"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          Image(image: AssetImage("assets/images/Group.png")),
          SizedBox(
            height: 30,
          ),
          Text(
            "Please enter your email address to recieve vervication code",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(108, 224, 224, 224),
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'E-mail',
                      )))),
          SizedBox(
            height: 20,
          ),
          customButtom(context, VerifyScreen(), "Send")
        ]),
      ),
    );
  }
}
