//
//  AppDelegate.swift
//  GitHub-Profile
//
//  Created by Ravindu Senevirathna on 1/3/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UIWindowSceneDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //initiate profile view controller
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ProfileViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

