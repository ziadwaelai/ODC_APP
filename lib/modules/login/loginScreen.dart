import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc_app/modules/forgetPassword/forgetPasswordScreen.dart';
import 'package:odc_app/modules/login/cubit/cubit.dart';
import 'package:odc_app/modules/login/cubit/states.dart';
import 'package:odc_app/modules/login/tostWidget.dart';
import 'package:odc_app/modules/register/registerScreen.dart';
import 'package:odc_app/shared/styles/colorsStyle.dart';

import '../../layout/layout.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _passwordVisible = false;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => loginCubit(),
        child: BlocConsumer<loginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSussessState) {
              tost(text: "Login successful");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AppLayout()));
            } else if (state is LoginErrorState) {
              tost(text: "Email or password is incorrect", error: true);
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
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
                                      fontSize: 35,
                                      fontWeight: FontWeight.w600),
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
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
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
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Email is required';
                                          } else if (!value.contains('@') ||
                                              !value.contains('.')) {
                                            return 'Please enter valid email ex : "example@mail.com"';
                                          }
                                          return null;
                                        },
                                        controller: emailController,
                                        obscureText: false,
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
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Password is required';
                                          } else if (value.length < 8) {
                                            return 'Password should be at least 8 characters';
                                          }
                                          return null;
                                        },
                                        controller: passwordController,
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
                                              _passwordVisible =
                                                  !_passwordVisible;
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
                                      if (formKey.currentState!.validate()) {
                                        loginCubit.get(context).userLogin(
                                            emailController.text,
                                            passwordController.text,
                                            context);
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: BorderSide(
                                                    color: defColor))))),
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
                                              builder: (context) =>
                                                  RegisterScreen()));
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
          },
        ));
  }
}
