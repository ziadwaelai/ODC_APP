import 'package:flutter/material.dart';
import 'package:odc_app/modules/forgetPassword/forgetPasswordScreen.dart';
import 'package:odc_app/modules/register/registerScreen.dart';
import 'package:odc_app/shared/styles/colorsStyle.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;
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
                    Container(
                      child: Image(
                        image: AssetImage("assets/images/Logo1.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          "Welcome ",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                              color: defColor,
                              fontSize: 35,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      "login",
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
                                validator: (value) {
                                  if (value != null) {
                                    return 'Your email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'E-mail',
                                )))),
                    SizedBox(
                      height: 30,
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
                                validator: (value) {
                                  if (value != null) {
                                    return 'your password';
                                  }
                                  return null;
                                },
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
                                )))),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgetPasswordScreen()));
                          },
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: defColor,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("object");
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(defColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(color: defColor))))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont't Have an Account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Text("Sign Up"))
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
