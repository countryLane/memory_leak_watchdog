//
//  ViewController.swift
//  exercise
//
//  Created by Yi.Wang on 2019/6/12.
//  Copyright © 2019 Yi.Wang. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "rootVC"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        cell.textLabel?.numberOfLines = 0
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Check mermory leak while [pop normal vc]"
        case 1:
            cell.textLabel?.text = "Check mermory leak while [dismiss vc]"
        case 2:
            cell.textLabel?.text = "Check mermory leak while [pop tabBarController and its subController]"
        default: break
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vcA = TestController()
            navigationController?.pushViewController(vcA, animated: true)
        case 1:
            let vcA = TestController()
            let naviController = UINavigationController(rootViewController: vcA)
            vcA.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(close))
            present(naviController, animated: true, completion: nil)
        case 2:
            let tabController = TabController()
            navigationController?.pushViewController(tabController, animated: true)
        default: break
        }
    }

    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
}
