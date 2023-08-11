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
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    var player: AVAudioPlayer!
    
    var eggTimes = ["Soft": 3,"Medium": 7,"Hard": 15]
    var counter = 1
    var timer = Timer()
    var selectedHardness = ""

    
    @objc func updateCounter() {
        
        if counter > 0 {
            var floatHardness = Float(eggTimes[selectedHardness]!)
            progressView.progress += 1.0 / floatHardness
            print("\(counter) seconds.")
            counter -= 1
        }
        
        else {
            timer.invalidate()
            titleLabel.text = "it's Ready!!"
            playSound()
            
        }
    }
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {

        
        progressView.progress = 0
        timer.invalidate()
        let hardness = sender.currentTitle!
        selectedHardness = hardness
        counter = eggTimes[hardness]!
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
      
        
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound" , withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}
