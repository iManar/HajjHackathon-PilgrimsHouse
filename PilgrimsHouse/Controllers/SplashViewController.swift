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

        setAppleLAnguageTo(lang: "ar")
//        playSplashVideo()
        self.present(CustomTabBar.customIrregularityStyle(delegate: nil), animated: true, completion: nil)
    }

    let APPLE_LANGUAGE_KEY = "AppleLanguages"
    
    func setAppleLAnguageTo(lang: String) {
        let userdef = UserDefaults.standard
        userdef.set([lang,currentAppleLanguage()], forKey: APPLE_LANGUAGE_KEY)
        userdef.synchronize()
    }
    
    func currentAppleLanguage() -> String{
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        let endIndex = current.startIndex
        let currentWithoutLocale = current.substring(to: current.index(endIndex, offsetBy: 2))
        return currentWithoutLocale
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
