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

        if ProcessInfo.processInfo.environment["XCInjectBundleInto"] != nil {
            return false
        }

        // Override point for customization after application launch.
        let album = AlbumRouter.createAlbumModule()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = album
        

        window?.makeKeyAndVisible()
        return true
    }
}

