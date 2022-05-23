import 'package:flutter/material.dart';
import 'package:odc_app/modules/forgetPassword/VeifyEmail.dart';
import '../../shared/styles/customButtom.dart';
import '../../shared/styles/customTextFormField.dart';

class ForgetPasswordScreen extends StatelessWidget {
TextEditingController? emailController;

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
      body: SingleChildScrollView(
        child: Padding(
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
            CustomTextFormFild("E-mail", emailController),
            SizedBox(
              height: 20,
            ),
            customButtom(context, VerifyScreen(), "Send")
          ]),
        ),
      ),
    );
  }
}
