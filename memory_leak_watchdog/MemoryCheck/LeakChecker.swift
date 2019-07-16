//
//  LeakChecker.swift
//  exercise
//
//  Created by Yi.Wang on 2019/6/13.
//  Copyright © 2019 Yi.Wang. All rights reserved.
//

import Foundation
import UIKit

class LeakChecker {

    private var currentRetainPathString: String = ""
    private var bobberArray: [Bobber]
    private var leakedItemArray: [String]

    class func check(vc: UIViewController) {
        self.init().start(rootVC: vc)
    }

    required init() {
        bobberArray = []
        leakedItemArray = []
    }

    private func start(rootVC: UIViewController) {
        setup(rootVC: rootVC)?.bfsBuild()?.check()
    }

    private func setup(rootVC: UIViewController) -> LeakChecker? {
        let rootName = type(of: rootVC).description().components(separatedBy: ".")
        let className: String = rootName.count >= 2 ? rootName[1] : (rootName.first ?? "rootVC")
        bobberArray = [Bobber(objPtr: rootVC, retainPathString: className, ivarName: className)]
        return self
    }

    private func bfsBuild() -> LeakChecker? {
        var index = 0
        while index < bobberArray.count {
            let bobber = bobberArray[index]
            index += 1
            guard let objPtr: AnyObject = bobber.weakObjPtr else { continue }
            let mirror = Mirror(reflecting: objPtr)
            mirror.children.enumerated().forEach { (offset: Int, element: Mirror.Child) in
                if let obj = element.value as? AnyObject {
                    let ivarName: String = element.label ?? "_" // use underline take place of anonymous ivar
                    let childBobber = Bobber(objPtr: obj,
                                             retainPathString: bobber.retainPathString + "." + ivarName,
                                             ivarName: ivarName)
                    bobberArray.append(childBobber)
                }
            }
        }
        return self
    }

    private func check() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            for bobber in self.bobberArray {
                if bobber.weakObjPtr == nil {
                    bobber.status = .released
                    continue
                }
                if self.leakedItemArray.filter({ leakedItemName -> Bool in
                    return bobber.retainPathString.contains(leakedItemName)
                }).count == 0 {
                    bobber.status = .leakedNeedReport
                    if let ivarName = bobber.ivarName {
                        self.leakedItemArray.append(ivarName)
                    }
                } else {
                    bobber.status = .parentLeaked
                }
            }

            let leakedObjMessage = self.bobberArray.filter({ bobber -> Bool in
                return bobber.status == .leakedNeedReport
            }).map({ bobber -> String in
                return "⚠️" + bobber.retainPathString
            }).joined(separator: "\n")

            if leakedObjMessage.count > 0 {
                DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "Memory Leak", message: leakedObjMessage, preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "Got it", style: .cancel, handler: nil)
                    alertController.addAction(cancelAction)
                    UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
