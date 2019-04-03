//
//  HelloViewController.swift
//  Runner
//
//  Created by AWOK on 3/31/19.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit
import Flutter
class HelloViewController: UIViewController {
    
    @IBOutlet weak var flutterStringLabel: UILabel!
    var value: String?
    var arrayList: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
      // flutterStringLabel.text =
        // Do any additional setup after loading the view.
        arrayList = ["Abhi","ADi","sayoni","anusha"]
    }
    
    @IBAction func goBackToFlutter(_ sender: UIButton) {
        //MARK:- FLutter to ios
        
//        let messenger = UIApplication.shared.keyWindow?.rootViewController as! FlutterViewController
//        let channel = FlutterMethodChannel.init(name: "samples.flutter.io/communication", binaryMessenger: messenger)
//        channel.invokeMethod("message", arguments: "Hello from iOS native host")
//        self.dismiss(animated: true, completion: nil)

        //MARK:- ios to Flutter
        let messenger = FlutterViewController()
        let channel = FlutterMethodChannel.init(name: "samples.flutter.io/communication", binaryMessenger: messenger)
      //  channel.invokeMethod("message", arguments: "hello world from ios")
        
        channel.setMethodCallHandler { (call: FlutterMethodCall , result: @escaping FlutterResult) in
            print("I have tapped")
            //let s = call.arguments as? [String: Any]
           // let from = s?["from"] as? String
            if (call.method == "getMessage") {
                var message = "{\"name\":\"karim\"}";
                //var fromValue = from ?? "abc"
                //var returnMessage = message + " " + fromValue
                result(message)
                
                
               
                
            }
            //self.dismiss(animated: true, completion: nil)
        }
        
        self.present(messenger, animated: true, completion: nil)
    }
    

}
