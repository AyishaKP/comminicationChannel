import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';

import 'package:native_communication/myObject.dart';

class ScreenOne extends StatefulWidget {
  ScreenOne() : super();

  final String title = "Screen One";

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  static const platform =
      const MethodChannel('samples.flutter.io/communication');
  String _message = "No messages yet...";
  List<String> _arraylist;
  Welcome welcomeModal;

  @override
  void initState() {
    _getMessage().then((String message) {
      setState(() {
        //_message = message;

        try {
         // final parsed = json.decode(message);
         // print("my output is $parsed");
          //_arraylist = parsed;

          welcomeModal = new Welcome.fromJson(json.decode(message));
          assert(welcomeModal != null);
        } on FormatException catch (e) {
          print("That string didn't look like Json.");
        } on NoSuchMethodError catch (e) {
          print('That string was null!');
        }
      });
    });
    super.initState();
    // platform.setMethodCallHandler(_handleMethod);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, position) {
          return GestureDetector(
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.black),
            ),
            title: Text(
              welcomeModal.name[position],
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          onTap: () {
            _showNativeView();
          },
             // showSnackBar(SnackBar(content: Text(position.toString()))),
        );
          // return Card(
            
          //   child: Text(welcomeModal.name[position]),
          // );
        },
      ),
    
      //Mark: with button
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         "Screen One",
      //       ),
      //       RaisedButton(
      //         child: Text("show Native View"),
      //         onPressed: () {

      //           _showNativeView();
      //         },
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  Future<void> _showNativeView() async {
    await platform.invokeMethod('showNativeView');

  }

  // Future<dynamic> _handleMethod(MethodCall call) async {
  //   switch(call.method) {
  //     case "message":
  //    // Navigator.pop(context);
  //       debugPrint(call.arguments);
  //       print("helloooo");
  //       return new Future.value("hello flutter..welcome back");
  //   }
  // }
  Future<String> _getMessage() async {
    var sendMap = <String, dynamic>{
      'from': 'sayoni',
    };
    String value;
    try {
      // value = await platform.invokeMethod('getMessage', sendMap);
      value = await platform.invokeMethod('getMessage');
    } catch (e) {
      print(e);
    }
    return value;
  }
}
