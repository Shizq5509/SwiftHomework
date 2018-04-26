//
//  VideoCell.swift
//  SwiftHomework
//
//  Created by shi.zhengqian on 2018/4/26.
//  Copyright © 2018年 shi.zhengqian. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

struct video {
    let image: String
    let title: String
    let source: String
}

class VideoCell: UITableViewCell {
    
    var videoScreenshot: UIImageView = UIImageView()
    var videoPlayButton: UIButton = UIButton()
    var videoTitleLabel: UILabel = UILabel()
    var videoSourceLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(videoScreenshot)
        self.contentView.addSubview(videoPlayButton)
        self.contentView.addSubview(videoTitleLabel)
        self.contentView.addSubview(videoSourceLabel)

        videoScreenshot.snp.makeConstraints { (make) in
            make.center.equalTo(self.contentView)
            make.size.equalTo(self.contentView)
        }
        
        videoPlayButton.addTarget(self, action: #selector(onPlay), for: UIControlEvents.touchUpInside)
        videoPlayButton.setImage(UIImage(named: "playBtn"), for: UIControlState.normal)
        videoPlayButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.contentView)
            make.size.equalTo(self.contentView).multipliedBy(0.5)
        }
        
        videoTitleLabel.font = UIFont(name: "Avenir Next Heavy", size: 14)
        videoTitleLabel.textColor = UIColor.white
        videoTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(videoPlayButton.snp.bottom).offset(6)
        }
        
        videoSourceLabel.font = UIFont(name: "Avenir Next Heavy", size: 10)
        videoSourceLabel.textColor = UIColor.lightText
        videoSourceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(videoTitleLabel.snp.bottom).offset(6)
            make.centerX.equalTo(self.contentView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWithModel(model:video) {
        videoScreenshot.image = UIImage(named: model.image)
        videoTitleLabel.text = model.title
        videoSourceLabel.text = model.source
    }
    
    @objc func onPlay() {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        let playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        let playerVC = AVPlayerViewController()
        playerVC.player = playerView
        
        UIApplication.shared.keyWindow?.rootViewController?.present(playerVC, animated: true, completion: {
            playerVC.player?.play()
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
