import 'package:flutter/material.dart';


class PlaceOrder extends StatefulWidget {

  final  name;
   PlaceOrder(this.name);
    @override
 
  _PlaceOrderState createState() => _PlaceOrderState(name);
}

class _PlaceOrderState extends State<PlaceOrder> {
 var name2;
 _PlaceOrderState(this.name2);

  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          InkWell(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/order.jpg',
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
                        height: 100,
                        child: Image.asset('assets/images/tenor.gif'),
                      ),

                     Container(
                       
                        margin: EdgeInsets.only(top: 15),
                       child: Text(name2,style: TextStyle(color: Colors.red,fontSize: 20 ),),),
                         Container(
                       
                        margin: EdgeInsets.only(top: 15),
                       child: Text('You made a great choice !',style: TextStyle(color: Colors.green,fontSize: 15 ),),),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Quantity',
                            prefixIcon: Icon(
                              Icons.tag_faces,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                        Container(
                        margin: EdgeInsets.only(top: 15,bottom: 15),
                       child: FlatButton(
                         child: Text('Place Order ! '),
                         onPressed: ()=>{},
                       ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      );
  }
}