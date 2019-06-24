//
//  AppDelegate.swift
//  db_swift_Kit
//
//  Created by Apple on 2019/6/1.
//  Copyright © 2019 cyan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let bar = DBTabBarController.init(names: ["AViewController","BViewController","AViewController","BViewController"], fifth: true, fifthImgName: "Icon_add").setupItemTitles(titles: ["A","B","A","B"]).setupItemsTitleDefaultColor(color: 0x000000).setupItemsTitleSelectedColor(color: 0xFFDD01).setUpUnSelectImages(images: ["home_icon_nor","home_icon_nor","home_icon_nor","home_icon_nor"]).setUpSelectImages(images: ["home_icon_sel","home_icon_sel","home_icon_sel","home_icon_sel"])
//        let navi = DBNavigationController();
//        navi.setViewControllers([AViewController(),BViewController()], animated: true)
        
        
//        let welcome = DBWelcomeViewController.init(names: ["http://img3.dob500.cn/2019/03/14/201903141526439779.jpg","http://img3.dob500.cn/2019/03/14/201903141537226848.jpg","http://img3.dob500.cn/2019/03/14/201903141527451426.jpg"], isurl: true)
//        let welcome = DBWelcomeViewController.init(names: ["http://img3.dianhuohuo.shop/images/e9f7d91a009eed04578bddceb337b791.gif","http://img3.dianhuohuo.shop/images/e9f7d91a009eed04578bddceb337b791.gif","http://img3.dianhuohuo.shop/images/e9f7d91a009eed04578bddceb337b791.gif"], isurl: true)
//        let welcome = DBWelcomeViewController.init(names: ["welcome_1.jpg","welcome_2.jpg","welcome_3.jpg"], isurl: false)
//        let welcome = DBWelcomeViewController.init(names: ["guideImage6.gif","guideImage7.gif","guideImage8.gif"], isurl: false)
        self.window?.rootViewController = bar
        
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

