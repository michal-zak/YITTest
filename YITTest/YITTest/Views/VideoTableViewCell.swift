//
//  VideoTableViewCell.swift
//  YITTest
//
//  Created by Michal Zak on 22/11/2020.
//  Copyright © 2020 Michal. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var viewPlayer: ViewPlayer!
    var timer: Timer?
    var sec: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func playTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    @objc func timerFunc(){
        self.sec += 1
    }
    
    func stopTimer()->Int{
        self.timer?.invalidate()
        return self.sec
    }
    
}
