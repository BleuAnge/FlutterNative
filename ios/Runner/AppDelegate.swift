import UIKit
import Flutter
import Toast

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      
      let METHOD_CHANNEL_NAME = "native_channel"
      
      let nativeChannel = FlutterMethodChannel(
        name: METHOD_CHANNEL_NAME,
        binaryMessenger: controller.binaryMessenger
      )
      
      nativeChannel.setMethodCallHandler({
          (call: FlutterMethodCall , result: @escaping FlutterResult) -> Void in
          switch call.method {
            case "function_call":
              self.window.makeToast(
                "Hello From IOS Native"
              )
              break;
            
            case "data_call":
              let username = "John Doe"

              self.window.makeToast(
                "Hello From IOS Native: \(username)"
              )

              result(username)
              break;
              
            case "advance_function_call":
              guard let args = call.arguments as? [String : String] else {return}
              let title = args["title"]!
              
              result(self.getBooks(title: title))
              
              break;
              
            default:
              result(FlutterMethodNotImplemented)
          }
      })
      
      
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private let bookList : Array<String> = [
        "Mushoku Tensei",
        "Talentless Nana",
        "Puella Magi Madoka Magica",
        "Non Non Biyori",
        "Doraemon",
        "Yu Gi Oh",
        "Dragon Ball",
        "Naruto",
        "Gintama"
    ]
    
    private func getBooks(title: String) -> Array<String> {
        return bookList.filter {
            $0.range(of: title, options: .caseInsensitive) != nil
        }
    }
}
