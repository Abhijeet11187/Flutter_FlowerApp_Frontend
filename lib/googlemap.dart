import 'package:flutter/material.dart';
import './login.dart';

//import 'package:flutter_webview_plugin/';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Gmap extends StatefulWidget {
  @override
  static const routeName = '/map';
  _GmapState createState() => _GmapState();
}

class _GmapState extends State<Gmap> with SingleTickerProviderStateMixin {
  @override
  AnimationController animationcontroller;
  Animation animation;

  void initState() {
    super.initState();
    animationcontroller =
        AnimationController(duration: Duration(seconds: 8), vsync: this);
    animation = IntTween(begin: 0, end: 2,).animate(
        CurvedAnimation(parent: animationcontroller, curve: Curves.easeOut));
       var val=animation.value.toString();
       print('hie');

    animationcontroller.forward();
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
        // drawer: Drawer(
        //   child: Builder(
        //     builder: (BuildContext context) {
        //       return WebviewScaffold(
        //         url: 'https://www.google.com/maps/place/Baner',
        //       );
        //     },
        //   ),
        // ),
        animation: animationcontroller,
        builder: (BuildContext context, Widget child) {
          return new Scaffold(
            body: Stack(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
               
                  child: Container(
                    
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                   // decoration: BoxDecoration,
                    color: Colors.white,
                      child: Image.asset('assets/images/loading.gif',width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,),
                  ),
                ),
                if(animation.value.toString()=='2') Container(
                 child: LoginForm(),
                )
              ],
            ),
          );
        });
  }
}


// Text(    
//                     animation.value.toString(),
//                     style: TextStyle(fontSize: 52,color: Colors.white),
//                   )