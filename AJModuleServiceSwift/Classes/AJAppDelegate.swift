//
//  AJAppDelegate.swift
//  AJModuleServiceSwift
//
//  Created by 徐结兵 on 2019/12/18.
//

import UIKit

@main
class AJAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    required override init() {
        AJModuleService.register()
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        let array = AJModuleServiceManager.shared.serviceArray
        for service in array {
            if service.responds(to: #selector(applicationDidFinishLaunching(_:))) {
                service.applicationDidFinishLaunching(application)
            }
        }
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

}
