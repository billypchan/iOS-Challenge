//
//  AppDelegate.swift
//  AlbumImageUpload
//
//  Created by chan bill on 14/9/2017.
//  Copyright © 2017 chan bill. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: - UIStateRestoration
    func application(_ application: UIApplication,
                              willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        if ProcessInfo.processInfo.environment["XCInjectBundleInto"] != nil {
            return false
        }
        
        // Override point for customization after application launch.
        let album = AlbumRouter.createModule()
        album.restorationIdentifier = "TabController"
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.restorationIdentifier = "MainWindow"
        
        window?.rootViewController = album
        
        
        window?.makeKeyAndVisible()

        return true
    }
    
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }
}

