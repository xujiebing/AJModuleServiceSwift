//
//  Service1.swift
//  AJModuleServiceSwift_Example
//
//  Created by 徐结兵 on 2019/12/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import AJModuleServiceSwift

class Service1: AJModuleService {
    override var priority: AJModuleServicePriority {
        get {
            return AJModuleServicePriority.veryHigh
        }
    }
    
    override func applicationDidFinishLaunching(_ application: UIApplication) {
        AJPrintLog("number 1")
    }
    
}
