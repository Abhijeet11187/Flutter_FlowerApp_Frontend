import 'package:flowerapp/admin.dart';
import 'package:flutter/material.dart';
import './showDetails.dart';
import 'dart:convert';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import './forgetPassword.dart';

import './admin.dart';

class LoginForm extends StatefulWidget {
  @override
  static const routeName = '/login';
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  @override
  adminLogin() {
    Navigator.of(context).pushNamed(AdminLogin.routeName);
  }

void storeDataShredPreference(onValue){
//print(onValue.body);
var alldata=jsonDecode(onValue.body);
print(alldata);
setSortingOrder(alldata);

}
  Map<String, String> headers = {"Content-type": "application/json"};

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNoController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _addressController = TextEditingController();

  var showData = 'Login';
  bool flag = false;
  var showData2 = "New User ?";
  void _toggle() {
    setState(() {
      if (flag) {
        showData = "Login";
        showData2 = "New User ?";
        flag = false;
      } else {
        showData = "Register";
        showData2 = "Already Have Account ";
        flag = true;
      }
    });
  }
  setSortingOrder(alldata) async {
  
print('saving the daat');
  print((alldata)['email']);
    
    try {
       
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      print('saving the data');
      print(alldata);
     
      prefs.setString('username', json.decode((alldata)['name']));
      
      prefs.setString('email', (alldata)['email']);
      prefs.setString('mobileNo', (alldata)['mobileNo']);
      prefs.setString('state',(alldata)['state']);
      prefs.setString('city',(alldata)['city']);

      prefs.setString('pinCode', (alldata)['pinCode']);

      prefs.setString('address',(alldata)['address']);
      
    

    } catch (e) {
      print('Errorrr!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      print(e);
    }
  }
void _forgetPassword(){
  Navigator.of(context).pushNamed(ForgetPassword.routeName);
}
  void _login() {
   // print('In the login');

    // print(_nameController.text);
    // print(_passwordController.text);
    // print(_confirmController.text);
    // print(_emailController.text);
    // print(_mobileNoController.text);
    // print(_stateController.text);
    // print(_cityController.text);
    // print(_pincodeController.text);

    if (_confirmController.text == '') {
        var url = 'http://192.168.0.126:3000/users/admin';

      //var url = 'http://192.168.0.126:3000/users/login';
         print('In the login');
      var data = json.encode({
        'username': _nameController.text,
        'password': _passwordController.text,
      });
      //Navigator.of(context).pushNamed(Details.routeName);

      http.post(url, headers: headers, body: data).then((onValue) {
        if(onValue.statusCode<400){
          storeDataShredPreference(onValue);
           _nameController.clear();
        _passwordController.clear();
        Navigator.of(context).pushNamed(Details.routeName);
        }
        else{
             showToast('Invalid Credentials');
        }
       
      });
    } else {
      var data = json.encode({
        'username': _nameController.text,
        'password': _passwordController.text,
        'mobileNo': _mobileNoController.text,
        'email': _emailController.text,
        'state': _stateController.text,
        'city': _cityController.text,
        'pinCode': _pincodeController.text,
        'address': _addressController.text
      });
      print('Password not Null');
      if (_confirmController.text == _passwordController.text) {
        print('Password Matched');
        var url = 'http://192.168.0.126:3000/users/signup';

        http.post(url, headers: headers, body: data).then((onValue) {
          //showToast("Registered successfully", duration: 2);
          _nameController.clear();
          _passwordController.clear();
          _confirmController.clear();
          _mobileNoController.clear();
          _emailController.clear();
          _addressController.clear();
          _stateController.clear();
          _cityController.clear();
          _pincodeController.clear();
          flag = !flag;
        });
      } else {
        print('Password not matched');
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          InkWell(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/background2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: SingleChildScrollView(
                child: InkWell(
                  onLongPress: adminLogin,
                  child: Card(
                    margin: EdgeInsets.all(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(showData),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: _nameController,
                            // autocorrect: true,
                            decoration: InputDecoration(
                              labelText: 'UserId',
                              prefixIcon: Icon(
                                Icons.ac_unit,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.pages,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        if (flag)
                          TextField(
                            obscureText: true,
                            controller: _confirmController,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              prefixIcon: Icon(
                                Icons.pages,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        if (flag)
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _mobileNoController,
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              prefixIcon: Icon(
                                Icons.pages,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        if (flag)
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email Id',
                              prefixIcon: Icon(
                                Icons.pages,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        if (flag)
                          TextField(
                            controller: _addressController,
                            decoration: InputDecoration(
                              labelText: 'Address',
                              prefixIcon: Icon(
                                Icons.pages,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        if (flag)
                          TextField(
                            controller: _stateController,
                            decoration: InputDecoration(
                              labelText: 'State',
                              prefixIcon: Icon(
                                Icons.pages,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        if (flag)
                          TextField(
                            controller: _cityController,
                            decoration: InputDecoration(
                              labelText: 'City',
                              prefixIcon: Icon(
                                Icons.pages,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        if (flag)
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _pincodeController,
                            decoration: InputDecoration(
                              labelText: 'Pincode',
                              prefixIcon: Icon(
                                Icons.pages,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        IconButton(
                          icon: Icon(Icons.check_circle_outline),
                          onPressed: _login,
                        ),
                       if(!flag) Container(
                    
                          child: FlatButton(
                            child: Text('Forget Password ?'),
                            onPressed: _forgetPassword,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: FlatButton(
                            child: Text(showData2),
                            onPressed: _toggle,
                          ),
                        ),
                      ],
                    ),
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
