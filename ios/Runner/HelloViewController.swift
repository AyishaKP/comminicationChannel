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
    override func viewDidLoad() {
        super.viewDidLoad()
      // flutterStringLabel.text =
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBackToFlutter(_ sender: UIButton) {
        let messenger = UIApplication.shared.keyWindow?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel.init(name: "samples.flutter.io/communication", binaryMessenger: messenger)
        channel.invokeMethod("message", arguments: "Hello from iOS native host")
        self.dismiss(animated: true, completion: nil)
//        channel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
//
//        }
       
       
        
    }
    

}
