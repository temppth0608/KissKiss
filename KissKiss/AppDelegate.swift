//
//  AppDelegate.swift
//  KissKiss
//
//  Created by 박태현 on 2016. 6. 26..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        print(#function)
        
        let 패스워드뷰컨트롤러 = UIStoryboard(name: "Password", bundle: nil).instantiateViewControllerWithIdentifier("암호") as! 비밀번호_뷰컨트롤러
        
        window?.rootViewController = 패스워드뷰컨트롤러
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        print(#function)
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        print(#function)
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        print(#function)
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        print(#function)
    }
    
    func applicationWillTerminate(application: UIApplication) {
        print(#function)
    }
}

