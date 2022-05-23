import 'package:flutter/material.dart';
import 'package:odc_app/modules/forgetPassword/CreateNewPassword.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../shared/styles/customButtom.dart';
import '../../shared/styles/colorsStyle.dart';

class VerifyScreen extends StatefulWidget {
  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController? textEditingController;
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Verify Your Email"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            Image(image: AssetImage("assets/images/Group2.png")),
            SizedBox(
              height: 40,
            ),
            Text(
              "please enter the 4-digit code sent to ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "ZiadWael142@gmail.com",
              style: TextStyle(
                  color: defColor, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: defColor,
                  fontWeight: FontWeight.bold,
                ),
                length: 4,
                obscureText: false,
                blinkWhenObscuring: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  disabledColor: Colors.white,
                  inactiveColor: Colors.white,
                  selectedFillColor: Colors.white,
                  selectedColor: Colors.white,
                  activeColor: Colors.white,
                  inactiveFillColor: Color.fromARGB(255, 197, 196, 196),
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                onCompleted: (v) {
                  debugPrint("Completed");
                },
                onChanged: (value) {
                  debugPrint(value);
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  debugPrint("Allowing to paste $text");

                  return true;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            customButtom(context, CreateNewPassword(), "Verify")
          ]),
        ),
      ),
    );
  }
}
