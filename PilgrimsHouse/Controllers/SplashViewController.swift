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
