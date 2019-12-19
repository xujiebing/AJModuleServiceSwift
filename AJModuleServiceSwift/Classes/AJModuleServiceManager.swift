//
//  AJModuleServiceManager.swift
//  AJModuleServiceSwift
//
//  Created by 徐结兵 on 2019/12/18.
//

import UIKit

class AJModuleServiceManager: NSObject {
    
    var serviceArray = [AJModuleService]();
    
    // 初始化单例方法
    static let shared = AJModuleServiceManager.init()
    private override init(){
        super.init()
    }
    
    func addService(service: AJModuleService) {
        self.serviceArray.append(service)
        self.serviceArray.sort { (priority0, priority1) -> Bool in
            return priority0.priority.rawValue > priority1.priority.rawValue
        }
    }
}
