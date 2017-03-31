//
//  AppDelegate.swift
//  DVM-Boilerplate
//
//  Created by Digices LLC on 3/30/17.
//  Copyright © 2017 Digices LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  // MARK: - Properties

  var window: UIWindow?

  let manager : AppManager = AppManager.shared

  // MARK: - UIApplicationDelegate methods

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    //
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    //
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    //
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    //
  }

  func applicationWillTerminate(_ application: UIApplication) {
    //
  }

}
