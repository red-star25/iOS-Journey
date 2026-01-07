//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft": 2, "Medium": 5, "Hard": 12]
    
    @IBOutlet var eggTitle: UILabel!
    @IBOutlet var progressTimer: UIProgressView!
    
    var player: AVAudioPlayer?
    var timer = Timer()
    var secondsRemaining = 60
    var totalTime = 0

    @IBAction func harnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        secondsRemaining = totalTime
        progressTimer.progress = 0
        eggTitle.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsRemaining > 0 {
            let progress = 1.0 - (Float(secondsRemaining) / Float(totalTime))
            progressTimer.progress = progress
            secondsRemaining -= 1
            
        } else {
            timer.invalidate()
            eggTitle.text = "Done!"
            progressTimer.progress = 1.0
            playSound()
        }
    }
    
    func playSound(){
        if let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") {
            player = try? AVAudioPlayer(contentsOf: url)
            player?.play()
        }
            
        
    }
    
}
