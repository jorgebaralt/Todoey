//
//  AppDelegate.swift
//  Todoeym
//
//  Created by Jorge Baralt on 2/4/19.
//  Copyright © 2019 Jorge Baralt. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)

        do{
            let _ =  try Realm()
        }catch{
            print("Error initializing realm \(error)")
        }
        
        return true
    }


}

