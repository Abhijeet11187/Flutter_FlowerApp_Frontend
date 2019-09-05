import 'package:flutter/material.dart';
import './order.dart';
class Images1 extends StatefulWidget {
  @override
  _Images1State createState() => _Images1State();
}

class _Images1State extends State<Images1> {
  @override
 static final _controller=PageController(
    initialPage: 0,
  );


  Future<void> _ackAlert() {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Column(
        children: <Widget>[
          
          AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: Colors.white,
            title: Text('Anemon'),
            
            content: Column(
              children: <Widget>[
                Image.asset('assets/images/giphy.gif',height: 170,),
                Container(
                
                  child: Text("Indeed, the word \nanemone, \nfirst attested in English in the mid-1500s probably comes from a Greek word literally meaning “daughter of the wind.”",)),
              ],
            ),
            
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                 
              IconButton(
               icon: Icon(Icons.done,color: Colors.red,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              
                ],
              ),

            ],
          ),
        ],
      );
    },
  );
}
  void _showDetails(){
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
            height:MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width,
            child: InkWell(
              onLongPress: _showDetails,
                          child: Card(
              //  margin: EdgeInsets.all(100),
                child: Container(
                  
                  child: Image.asset(
                    'assets/images/flower.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
PlaceOrder('Anemon'),
],



  ));
  
  
    
  }
}
