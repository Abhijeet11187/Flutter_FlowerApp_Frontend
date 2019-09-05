import 'package:flutter/material.dart';
import './order.dart';
class Images2 extends StatefulWidget {
  @override
  _Images2State createState() => _Images2State();
}

class _Images2State extends State<Images2> {
  @override
  static final _controller=PageController(
    initialPage: 0,
  );
  Future<void> _ackAlert() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white,
          title: Text('Amaryills'),
        content: Column(
              children: <Widget>[
                Image.asset('assets/images/giphy.gif',height: 170,),
                Container(
                
                  child: Text("Indeed, the word \nanemone, \nfirst attested in English in the mid-1500s probably comes from a Greek word literally meaning “daughter of the wind.”",)),
              ],
            ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.done,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDetails() {
    print("long Pressed");
    _ackAlert();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
controller: _controller,
scrollDirection: Axis.vertical,
children: <Widget>[
   Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
            child: InkWell(
              onLongPress: _showDetails,
                          child: Card(
              //  margin: EdgeInsets.all(50),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/floweer.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
  PlaceOrder('Amaryills'),
],



  ));
  }
}

