//
//  TimerDemo.swift
//  SwiftHomework
//
//  Created by shi.zhengqian on 2018/4/25.
//  Copyright © 2018年 shi.zhengqian. All rights reserved.
//

import UIKit
import SnapKit

class TimerDemo: UIViewController {
    let labelTime = UILabel()
    let btnReset = UIButton()
    let btnPlay = UIButton()
    let btnPause = UIButton()
    
    var count = 0.0
    var timer = Timer()
    var isTiming = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        guard let nav:UINavigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController, !nav.viewControllers.contains(self) else {
            return
        }
        timer.invalidate()
        isTiming = false
    }
    
    deinit {
        print("deinit")
    }
    
    // MARK: - layout
    func layoutSubviews() {
        self.view.backgroundColor = UIColor.black
        
        labelTime.font = UIFont.boldSystemFont(ofSize: 100)
        labelTime.textColor = UIColor.white
        self.view.addSubview(labelTime)
        labelTime.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(100)
        }
        resetLabel(text: String(format: "%.1f", count))
        
        btnReset.setTitle("Reset", for: UIControlState.normal)
        btnReset.setTitleShadowColor(UIColor.gray, for: UIControlState.highlighted)
        btnReset.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btnReset.titleLabel?.textColor = UIColor.white
        self.view.addSubview(btnReset)
        btnReset.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.top.equalTo(self.view).offset(100)
            make.right.equalTo(self.view).offset(-30)
        }
        btnReset.addTarget(self, action: #selector(onReset), for: UIControlEvents.touchUpInside)
        
        btnPlay.setImage(UIImage(named: "play"), for: UIControlState.normal)
        self.view.addSubview(btnPlay)
        btnPlay.snp.makeConstraints { (make) in
            make.top.equalTo(labelTime.snp.bottom).offset(50)
            make.left.equalTo(0)
            make.bottom.equalTo(self.view)
            make.width.equalTo(self.view).multipliedBy(0.5)
        }
        btnPlay.backgroundColor = UIColor.blue
        btnPlay.addTarget(self, action: #selector(onPlay), for: UIControlEvents.touchUpInside)
        
        btnPause.setImage(UIImage(named: "pause"), for: UIControlState.normal)
        self.view.addSubview(btnPause)
        btnPause.snp.makeConstraints { (make) in
            make.top.equalTo(labelTime.snp.bottom).offset(50)
            make.left.equalTo(btnPlay.snp.right)
            make.bottom.equalTo(self.view)
            make.width.equalTo(self.view).multipliedBy(0.5)
        }
        btnPause.backgroundColor = UIColor.green
        btnPause.addTarget(self, action: #selector(onPause), for: UIControlEvents.touchUpInside)
    }
    
    func resetLabel(text:String) {
        labelTime.text = text
    }
    
    // MARK: - events
    @objc func onReset() {
        count = 0.0
        resetLabel(text: String(format: "%.1f", count))
        self.navigationController?.pushViewController(TimerDemo(), animated: true)
    }
    
    @objc func onPlay() {
        guard !isTiming else {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        isTiming = true
    }
    
    @objc func onPause() {
        timer.invalidate()
        isTiming = false
    }
    
    @objc func updateTime() {
        count += 0.1
        resetLabel(text: String(format: "%.1f", count))
    }
}
