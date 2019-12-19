//
//  main.swift
//  AJModuleServiceSwift_Example
//
//  Created by 徐结兵 on 2019/12/6.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

// Swift 2 使用Process.argc
let argc = CommandLine.argc // Swift 3 把 Process改为CommandLine 了
let argv = UnsafeMutablePointer<UnsafeMutablePointer<Int8>>.allocate(capacity: Int(CommandLine.argc))
// let argv = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))
UIApplicationMain(argc, argv, nil, NSStringFromClass(AJAppDelegate.self))
