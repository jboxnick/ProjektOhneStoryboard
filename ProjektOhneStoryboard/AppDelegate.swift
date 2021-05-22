//
//  AppDelegate.swift
//  ProjektOhneStoryboard
//
//  Created by Julian on 22.05.21.
// --------------------------------

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppController.shared.showInitialView(window: UIWindow(frame: UIScreen.main.bounds))
        
        return true
    }
}

