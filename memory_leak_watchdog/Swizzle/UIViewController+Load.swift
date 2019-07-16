//
//  UIViewController+Load.swift
//  exercise
//
//  Created by Yi.Wang on 2019/6/12.
//  Copyright © 2019 Yi.Wang. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: LoadForSwiftProtocol {
    public static func swiftLoad() {
        if self !== UIViewController.self {
            return
        }
        swizzle(originalSEL: #selector(viewDidDisappear), targetSEL: #selector(wy_viewDidDisappear), target: self)
    }

    @objc func wy_viewDidDisappear(_ animated: Bool) {
        self.wy_viewDidDisappear(animated)

        guard isLeaving() else { return }
        guard (self is UIAlertController == false) else { return }

        check(vc: self)
    }

    private func check(vc: UIViewController) {
        LeakChecker.check(vc: vc)
        if let naVC = vc as? UINavigationController {
            naVC.viewControllers.forEach { subvc in
                check(vc: subvc)
            }
        } else if let tabVC = vc as? UITabBarController {
            tabVC.viewControllers?.forEach { subvc in
                check(vc: subvc)
            }
        }
    }

    private func isLeaving() -> Bool {
        return isBeingDismissed || isMovingFromParent
    }
}

func swizzle(originalSEL: Selector, targetSEL: Selector, target: AnyClass) {
    guard let originalMethod = class_getInstanceMethod(target, originalSEL) else { return }
    guard let swizzledMethod = class_getInstanceMethod(target, targetSEL) else { return }
    
    let success = class_addMethod(target, originalSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
    if success {
        class_replaceMethod(target, targetSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}
