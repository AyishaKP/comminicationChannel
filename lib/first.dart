import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class ScreenOne extends StatefulWidget {
  ScreenOne() : super();
 
  final String title = "Screen One";
 
  @override
  _ScreenOneState createState() => _ScreenOneState();
}
 
class _ScreenOneState extends State<ScreenOne> {
  static const platform = const MethodChannel('samples.flutter.io/communication');
 
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    platform.setMethodCallHandler(_handleMethod);

  }
 
 
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Screen One",
            ),
            RaisedButton(
              child: Text("show Native View"),
              onPressed: () {
                
                _showNativeView();
              },
            )
          ],
        ),
      ),
    );
  }
getText(String text){
  return new Text(text);
}
  Future<void> _showNativeView() async {
    await platform.invokeMethod('showNativeView');
    
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch(call.method) {
      case "message":
     // Navigator.pop(context);
        debugPrint(call.arguments);
        print("helloooo");
        //return new Future.value("hello flutter..welcome back");
    }
  }
}