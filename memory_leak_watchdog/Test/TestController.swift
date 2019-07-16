//
//  TestController.swift
//  exercise
//
//  Created by Yi.Wang on 2019/6/12.
//  Copyright © 2019 Yi.Wang. All rights reserved.
//

import UIKit

class TestController: UIViewController {
    
    private var closure: () -> Void = {}
    private let pureSwiftObj1 = PureSwiftClass()
    private let pureSwiftObj2 = PureSwiftClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
