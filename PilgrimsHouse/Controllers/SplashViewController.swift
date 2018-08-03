//
//  SplashViewController.swift
//  PilgrimsHouse
//
//  Created by tr on 8/1/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit
import AVFoundation


class SplashViewController: UIViewController {

    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playSplashVideo()
        

//          self.present(CustomTabBar.customIrregularityStyle(delegate: nil), animated: true, completion: nil)
      
        
//        UIApplication.shared.openURL(URL(string: "https://www.google.com/maps/dir/Jeddah/Mecca/@21.5163449,39.3770183,11z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x15c3d01fb1137e59:0xe059579737b118db!2m2!1d39.1925048!2d21.485811!1m5!1m1!1s0x15c21b4ced818775:0x98ab2469cf70c9ce!2m2!1d39.8579118!2d21.3890824!3e0")!)
//        self.present(MapViewController.instantiate(fromAppStoryboard: .Map), animated: true, completion: nil)

    }

    
    private func playSplashVideo() {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
        } catch { }
        
        guard let path = Bundle.main.path(forResource: "splash", ofType:"mp4") else {
            debugPrint("splash.mp4 not found")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resize
        playerLayer.zPosition = -1
        
        self.view.layer.addSublayer(playerLayer)
        
        player?.seek(to: kCMTimeZero)
        player?.play()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerDidFinishPlaying(note:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: player?.currentItem)
    }
    
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        
        self.present(CustomTabBar.customIrregularityStyle(delegate: nil), animated: true, completion: nil)
    }

}
