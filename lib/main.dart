import 'package:flutter/material.dart';
import './login.dart';
import './showDetails.dart';
import './admin.dart';
import './googlemap.dart';
import './forgetPassword.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        LoginForm.routeName: (ctx) => LoginForm(),
        Details.routeName: (ctx) => Details(),
        AdminLogin.routeName: (ctx) => AdminLogin(),
        Gmap.routeName: (ctx) => Gmap(),
        ForgetPassword.routeName:(ctx)=>ForgetPassword()  
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>with SingleTickerProviderStateMixin {
  @override
 
  void _imageTapped() {
    print('object');
   // Navigator.of(context).pushNamed(LoginForm.routeName);
   Navigator.of(context).pushNamed(Gmap.routeName);
  }

  void adminLogin() {
    Navigator.of(context).pushNamed(AdminLogin.routeName);
  }

  void showgoogleMap() {
   //  Navigator.of(context).pushNamed(Gmap.routeName);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
          child: Stack(
            children: <Widget>[
              Material(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/flower_theme.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: showgoogleMap,
                  onDoubleTap: _imageTapped,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
