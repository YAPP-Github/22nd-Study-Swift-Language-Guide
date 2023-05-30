//
//  AppDelegate.swift
//  testApp
//
//  Created by 천수현 on 2023/05/30.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    let rootViewController = UINavigationController(rootViewController: UIViewController())
    rootViewController.pushViewController(ViewController(), animated: false)
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
    return true
  }
}

