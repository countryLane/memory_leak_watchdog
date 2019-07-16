//
//  PureSwiftClass.swift
//  exercise
//
//  Created by Yi.Wang on 2019/6/12.
//  Copyright © 2019 Yi.Wang. All rights reserved.
//

import Foundation

var aaa: AnyObject? = nil

class SwiftOCClass: NSObject {
    
}

class PureSwiftClass {
    let swiftOCObject: SwiftOCClass = SwiftOCClass()
    var closure: () -> Void = {}
    
    init() {
        captureSelf()
    }
    
    func captureSelf() {
        closure = {
            self
        }
    }
}
