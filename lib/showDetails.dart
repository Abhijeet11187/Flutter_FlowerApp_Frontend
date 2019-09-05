import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './images2.dart';
import './image1.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import './order.dart';
import './image3.dart';
import './image4.dart';
import './image5.dart';

class Details extends StatefulWidget {
  @override
  static const routeName = '/details';
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  static final _controller = PageController(
    initialPage: 0,
  );
  getData() {
    print('Pressed');
    getDaata();
  }
getDaata() async {
  print('Getting data from setpreferences');
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      print(prefs.getString('username'));

      print(prefs.getString('email'));
      print(prefs.getString('mobileNo'));
      print(prefs.getString('state'));
      print(prefs.getString('city'));
      print(prefs.getString('pinCode'));
      print(prefs.getString('address'));
      //id = prefs.getString('token');
      //print(pin.text);
    }
  //final pageView=
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Images1(),
              Images2(),
              Images3(),
              Image4(),
              Image5(),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.mode_edit,
          color: Colors.white,
        ),
        onPressed: getData,
      ),
    );
  }
}
