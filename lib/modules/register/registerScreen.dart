import 'package:flutter/material.dart';
import 'package:odc_app/shared/styles/colorsStyle.dart';

import '../../layout/layout.dart';
import '../../shared/styles/customButtom.dart';
import '../login/loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          "Hello, ",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Friend",
                          style: TextStyle(
                              color: defColor,
                              fontSize: 35,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(108, 224, 224, 224),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                                obscureText: false,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Full Name',
                                    icon: Icon(Icons.person))))),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(108, 224, 224, 224),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                                obscureText: false,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'E-mail',
                                    icon: Icon(Icons.email))))),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(108, 224, 224, 224),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {});
                                        _passwordVisible = !_passwordVisible;
                                      },
                                    ),
                                    border: InputBorder.none,
                                    labelText: 'password',
                                    icon: Icon(Icons.password_sharp))))),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(108, 224, 224, 224),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Phone number',
                                    icon: Icon(Icons.phone))))),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(108, 224, 224, 224),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Address',
                                    icon: Icon(Icons.location_city))))),
                    Row(
                      children: [
                        Checkbox(
                          value: this.value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                        Text(
                          "Do you agree to our",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogInScreen()));
                            },
                            child: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                color: defColor,
                                decoration: TextDecoration.underline,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: customButtom(context, AppLayout(), "Sing Up")),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have an Account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogInScreen()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: defColor),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
