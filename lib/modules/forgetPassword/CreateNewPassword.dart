import 'package:flutter/material.dart';

import 'package:odc_app/shared/styles/customTextFormField.dart';

import '../../shared/styles/CustomButtom.dart';
import 'VeifyEmail.dart';

class CreateNewPassword extends StatelessWidget {
  TextEditingController? passwordController;
  TextEditingController? ConfirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create New Password"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            Image(image: AssetImage("assets/images/Group3.png")),
            SizedBox(
              height: 30,
            ),
            Text(
              "Please enter New Password",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormFild("label", passwordController),
            CustomTextFormFild("label", ConfirmPasswordController),
            customButtom(context, VerifyScreen(), "Submit")
          ]),
        ),
      ),
    );
  }
}
