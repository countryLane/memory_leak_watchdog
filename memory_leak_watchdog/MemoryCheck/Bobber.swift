//
//  Bobber.swift
//  exercise
//
//  Created by Yi.Wang on 2019/7/3.
//  Copyright © 2019 Yi.Wang. All rights reserved.
//

import Foundation

class Bobber {

    enum Status {
        case checking
        case released
        case leakedNeedReport
        case parentLeaked
    }

    weak var weakObjPtr: AnyObject?
    var retainPathString: String = ""
    var ivarName: String?
    var status: Status

    init(objPtr: AnyObject?, retainPathString: String, ivarName: String?, status: Status = .checking) {
        self.weakObjPtr = objPtr
        self.retainPathString = retainPathString
        self.ivarName = ivarName
        self.status = status
    }
}
