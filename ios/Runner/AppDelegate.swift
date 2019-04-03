import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    
    //MARK:- Flutter to ios
    
//    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
//    let communicationChannel = FlutterMethodChannel(name: "samples.flutter.io/communication",
//                                              binaryMessenger: controller)
//    communicationChannel.setMethodCallHandler { (call: FlutterMethodCall , result: @escaping FlutterResult) in
//        print("I have tapped")
//
//        let communicationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HelloViewController")
//        controller.present(communicationVC, animated: true, completion: nil)
//
//
//        result("true")
//
////        if (call.method == "showNativeView" ) {
////             let communicationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HelloViewController")
////            controller.present(communicationVC, animated: true, completion: nil)
////            result("true")
////        }else {
////            result(FlutterMethodNotImplemented)
////        }
//
//    }
    
    //MARK:- ios to Flutter
    let communicationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HelloViewController")
    
    self.window.rootViewController = UINavigationController(rootViewController: communicationVC)
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
   
}
