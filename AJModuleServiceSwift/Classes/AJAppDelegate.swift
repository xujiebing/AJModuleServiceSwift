//
//  AJAppDelegate.swift
//  AJModuleServiceSwift
//
//  Created by 徐结兵 on 2019/12/18.
//

import UIKit
import AJUIKit

@main
class AJAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    required override init() {
        AJModuleService.register()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let array = AJModuleServiceManager.shared.serviceArray
        for service in array {
            service.applicationDidFinishLaunching(application, launchOptions)
        }
        return true
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        let vcName = AJCurrentVC().className
        let array = AJModuleServiceManager.shared.serviceArray
        var orientation = UIInterfaceOrientationMask.all
        for service in array {
            let result = service.supportedInterfaceOrientations(application, vcName)
            if result.0 {
                return result.1
            }
        }
        return .all
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        let array = AJModuleServiceManager.shared.serviceArray
        for service in array {
            if service.responds(to: #selector(applicationWillResignActive(_:))) {
                service.applicationWillResignActive(application)
            }
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        let array = AJModuleServiceManager.shared.serviceArray
        for service in array {
            if service.responds(to: #selector(applicationDidEnterBackground(_:))) {
                service.applicationDidEnterBackground(application)
            }
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        let array = AJModuleServiceManager.shared.serviceArray
        for service in array {
            if service.responds(to: #selector(applicationWillEnterForeground(_:))) {
                service.applicationWillEnterForeground(application)
            }
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        let array = AJModuleServiceManager.shared.serviceArray
        for service in array {
            if service.responds(to: #selector(applicationDidBecomeActive(_:))) {
                service.applicationDidBecomeActive(application)
            }
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        let array = AJModuleServiceManager.shared.serviceArray
        for service in array {
            if service.responds(to: #selector(applicationWillTerminate(_:))) {
                service.applicationWillTerminate(application)
            }
        }
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let array = AJModuleServiceManager.shared.serviceArray
        for service in array {
            service.didRegisterForRemoteNotifications(application, deviceToken: deviceToken)
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let array = AJModuleServiceManager.shared.serviceArray
        for service in array {
            service.didReceiveRemoteNotification(application, userInfo: userInfo, fetchCompletionHandler: completionHandler)
        }
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        let array = AJModuleServiceManager.shared.serviceArray
        for service in array {
            service.applicationContinue(application, userActivity: userActivity, restorationHandler: restorationHandler)
        }
        return true
    }
    
}
