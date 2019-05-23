//
//  AppDelegate.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 23/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator.start()
        
        return true
    }

}

