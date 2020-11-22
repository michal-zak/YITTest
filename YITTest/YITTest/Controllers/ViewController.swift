//
//  ViewController.swift
//  YITTest
//
//  Created by Michal Zak on 22/11/2020.
//  Copyright © 2020 Michal. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var photoViewModel : PhotoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "ImgTableViewCell", bundle: nil), forCellReuseIdentifier: "ImgCell")
        self.tableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "videoCell")
        
        callToViewModel()
    }

    func callToViewModel(){
        
        self.photoViewModel =  PhotoViewModel()
        self.photoViewModel.viewModelToController = {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row==12 || indexPath.row==40){
            let cell:VideoTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "videoCell") as! VideoTableViewCell
            
            let path = Bundle.main.path(forResource: "countries", ofType: "mp4")
            
            let player = AVPlayer(url: URL(fileURLWithPath: path!))
            cell.viewPlayer?.playerLayer.player = player
            return cell
        }else{
            let cell:ImgTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "ImgCell") as! ImgTableViewCell
            
            let p = photos[indexPath.row]
            cell.img.image = UIImage(named: p.name)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(indexPath.row==12 || indexPath.row==40){
            return 9/16 * tableView.contentSize.width
        }else{
            let p = photos[indexPath.row]
            return (UIImage(named: p.name)?.size.height)!/(UIImage(named: p.name)?.size.width)! * tableView.contentSize.width
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        guard let cell = (cell as? VideoTableViewCell) else { return }
        if(indexPath.row==12 || indexPath.row==40){
            let time = CMTime(value: CMTimeValue(cell.sec), timescale: 1)
            cell.viewPlayer.player?.seek(to: time)
            cell.viewPlayer.player?.play()
            cell.playTimer()
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? VideoTableViewCell else { return }
        cell.viewPlayer.player?.pause()
        cell.stopTimer()
    }


}

