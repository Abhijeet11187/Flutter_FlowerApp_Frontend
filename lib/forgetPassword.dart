import 'dart:convert';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgetPassword extends StatefulWidget {
  @override
  static const routeName = '/forget';
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Map<String, String> headers = {"Content-type": "application/json"};
  bool emailValid = true;
  var _otp;
  var enterEmail = 'Enter Email Id';
  var sent = 'Send OTP';
  void sentMail() {
    print(sent);
    if (sent == 'Validate OTP') {
      print((_emailController.text));
      print(_otp);
      if (_emailController.text.toString() == _otp.toString()) {
        print('OTP MAtches');
        _emailController.clear();
        emailValid = true;
//************************************************************************************************ */
  // Change The password Remailniing
        setState(() {
          enterEmail = "Enter new Password";
          sent = "Change Password";
        });
      } else {
        print('Not matches');
        showToast('OTP not matches');
      }
    } else {
      var url = 'http://192.168.0.126:3000/users/forget';

      var data = jsonEncode({
        "email": _emailController.text,
      });
      http.post(url, headers: headers, body: data).then((onValue) {
        print(onValue.body);
        if (onValue.statusCode < 400) {
          _otp = jsonDecode(onValue.body)['OTP'];
          _emailController.clear();
          showToast('OTP sent to register EmailID');
          setState(() {
            enterEmail = "Enter OTP";
            sent = "Validate OTP";
          });
        }
        else{
          showToast('Email Id not Found');
        }
      });

      //print(_emailController.text);
    }
  }

  final _emailController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/forgetPassword.gif',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            height: 220,
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.transparent,
                  margin: EdgeInsets.all(50),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: enterEmail,
                          errorText: emailValid ? " " : "Enter Valid Id",
                        ),
                        onChanged: (value) => {
                          setState(() {
                            if (enterEmail == 'Enter Email Id') {
                              emailValid = RegExp(
                                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                            }
                          })
                        },
                      ),
                      FlatButton(
                        child: Text(sent),
                        onPressed: sentMail,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showToast(String msg, {int duration}) {
    Toast.show(msg, context, duration: duration);
  }
}
