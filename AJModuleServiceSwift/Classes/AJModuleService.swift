//
//  AJModuleService.swift
//  AJModuleServiceSwift
//
//  Created by 徐结兵 on 2019/12/6.
//

import AJFoundation
import KakaJSON

private let fileName = "moduleserviceConfig"
private let fileType = "json"

// 模块service调用优先级
public enum AJModuleServicePriority: Int {
    case veryLow = 0 // 最低
    case low
    case medium
    case high
    case veryHigh // 最高
}

class AJModuleServiceModel: Convertible {
    var module: String?
    var className: String?
    var service: AnyClass? {
        get {
            guard module != nil || className != nil else {
                return nil
            }
            let fullClassName = "\(module!).\(className!)"
            guard let cls = NSClassFromString(fullClassName) else {
                return nil
            }
            guard cls is AJModuleService.Type else {
                AJLog("\(fullClassName) is not subClass of AJModuleService")
                return nil
            }
            return cls
        }
    }
    required init() {
        
    }
}

open class AJModuleService: NSObject, UIApplicationDelegate {
    
    open var priority:AJModuleServicePriority {
        get {
            return AJModuleServicePriority.medium
        }
    }
    
    required override public init() {
        
    }
    
    class func register() {
        let array = moduleServiceClasses()
        for service in array {
            let vcClass = service as! AJModuleService.Type
            let service = vcClass.init()
            AJModuleServiceManager.shared.addService(service: service)
        }
    }
    
    class func moduleServiceClasses() -> [AnyClass] {
        var classArray = [AnyClass]()
        let path = Bundle.main.path(forResource: fileName, ofType: fileType)
        guard path != nil else {
            assert(false, "未配置 \(fileName).\(fileType) 文件")
            return []
        }
        do {
            let json = try Bundle.ajGetJsonStringWithPath(path: path!)
            let clsArray:[AJModuleServiceModel] = json?.kj.modelArray(AJModuleServiceModel.self) ?? []
            for model in clsArray where model.service != nil {
                classArray.append(model.service!)
            }
        } catch {
            AJLog("\(fileName).\(fileType) 解析失败")
        }
        return classArray
    }
    
    open func applicationDidFinishLaunching(_ application: UIApplication) {
        
    }
     
    open func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    open func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    open func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    open func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    open func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    open func didRegisterForRemoteNotifications(_ application: UIApplication, deviceToken: Data) {

    }
    
    open func didReceiveRemoteNotification(_ application: UIApplication, userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
    
    open func applicationContinue(_ application: UIApplication, userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        return true
    }
}
