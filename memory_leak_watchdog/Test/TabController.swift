//
//  TabController.swift
//  exercise
//
//  Created by Yi.Wang on 2019/7/9.
//  Copyright © 2019 Yi.Wang. All rights reserved.
//

import Foundation
import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [makeSubController("TabA"), makeSubController("TabB")]
    }

    private func makeSubController(_ name: String) -> UINavigationController {
        let vcA = TestController()
        let naviController = UINavigationController(rootViewController: vcA)
        vcA.title = name
        return naviController
    }
}
