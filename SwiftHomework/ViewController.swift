//
//  ViewController.swift
//  SwiftHomework
//
//  Created by shi.zhengqian on 2018/4/25.
//  Copyright © 2018年 shi.zhengqian. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var titles = [String]()
    var classes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "🍬 Swift Demo 🍬"
        setupDemos()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupDemos() {
        self.addClass(title: "Timer", className: "TimerDemo")
        self.addClass(title: "Video", className: "VideoDemo")
    }
    
    func addClass(title:String,className:String) {
        self.titles.append(title)
        self.classes.append(className)
    }
    
// MARK: - tableview delegate and datasource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellid"
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        cell!.textLabel?.text = String(indexPath.row+1) + ".  " + titles[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let name:String = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            return
        }
        let cls:AnyClass? = NSClassFromString(name+"."+classes[indexPath.row])
        guard let typeClass = cls as? UIViewController.Type else {
            return
        }
        self.navigationController?.pushViewController(typeClass.init(), animated: true)
    }
}

