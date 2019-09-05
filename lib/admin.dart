import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  @override
  static const routeName="/admin";
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  void _login(){

  }
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          InkWell(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/admin.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              
              child: SingleChildScrollView(
                child: Card(
                  
                  margin: EdgeInsets.all(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Column(
                    children: <Widget>[
                     
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Admin Id',
                            prefixIcon: Icon(
                              Icons.ac_unit,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.pages,
                            color: Colors.black,
                          ),
                        ),
                      ),
                     
                     Container(
                       
                         margin: EdgeInsets.only(bottom: 10,top:7),
                       child: FlatButton(
                         child: Text('Login as Admin'),
                         onPressed: ()=>{},
                       ),
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
}