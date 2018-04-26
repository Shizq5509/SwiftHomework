//
//  VideoDemo.swift
//  SwiftHomework
//
//  Created by shi.zhengqian on 2018/4/26.
//  Copyright © 2018年 shi.zhengqian. All rights reserved.
//

import UIKit

class VideoDemo: UITableViewController {
    
    var data = [video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareData() {
        data.append(video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"))
        data.append(video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"))
        data.append(video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"))
        data.append(video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"))
        data.append(video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"))
        data.append(video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30"))
    }
    
    // MARK: - tableview delegate and datasource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "videocellid"
        var cell:VideoCell? = tableView.dequeueReusableCell(withIdentifier: cellId) as? VideoCell
        if cell == nil {
            cell = VideoCell(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        cell?.setupWithModel(model: data[indexPath.row])
        return cell!
    }
}
