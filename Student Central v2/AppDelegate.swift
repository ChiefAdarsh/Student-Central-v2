//
//  AppDelegate.swift
//  Student Central v2
//
//  Created by Adarsh Goura on 1/27/23.
//

import UIKit
import FirebaseCore
import FirebaseDatabase
import FirebaseDatabaseSwift
import FirebaseAuth

var yourArray: [Resource] = [Resource]()
let ref = Database.database().reference()

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        readResourcesValue()
        readTeacherValue()
        return true
    }
    
//    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.tokenRefreshNotification), name: kFIRInstanceIDTokenRefreshNotification, object: nil)
//    }
//
//    func tokenRefreshNotification(notification: NSNotification) {
//        if let token = FIRInstanceID.instanceID().token() {
//            refreshedToken = token
//
//        }
//    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func readResourcesValue() {
        Auth.auth().signIn(withEmail: "practicumit@gmail.com", password: "@Varshith123") { [weak self] authResult, error in
            guard let strongSelf = self else { return }

            authResult!.user.getIDToken() { (token: String!, error: Error?) in
                print("token: \"" + token + "\"")
                
                let userID = Auth.auth().currentUser!.uid
                Database.database().reference().child("users").child("studentHelpResources").observeSingleEvent(of: .value, with: { (snapshot) in
                    guard let values = snapshot.value as? [String: Any] else {
                      return
                    }

                    for (key, value) in values {
                            let resource = value as! [String: Any]
                            let name = resource["name"] as! String
                            let category = resource["category"] as! String
                            let contact = resource["contact"] as? String ?? ""
                            let address = resource["address"] as? String ?? ""
                            let city = resource["city"] as? String ?? ""
                            let state = resource["state"] as? String ?? ""
                            let zip = resource["zip"] as? String ?? ""
                            let website = resource["website"] as? String ?? ""
                            let addInfo = resource["addInfo"] as! String

                            yourArray.append(Resource(category: category, name: name, contact: contact, address: address, city: city, state: state, zip: zip, website: website, addInfo: addInfo))
                    }

                    // for i in yourArray {
                    //   print(i.name)
                    //   print(i.category)
                    //   print(i.contact)
                    //   print(i.address)
                    //   print(i.city)
                    //   print(i.state)
                    //   print(i.zip)
                    //   print(i.website)
                    //   print(i.addInfo)
                    //   print("\n")
                    // }
                })
            }
        }
    }
}

