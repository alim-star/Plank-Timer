//
//  ViewController.swift
//  Plank Timer
//
//  Created by Muhammad Ali on 2022-02-14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPLayer: AVAudioPlayer!

    @IBOutlet weak var progressBar: UIProgressView!
    
    let plankTimes = [ "30" : 30, "60" : 60, "90": 90 ]
    
    var timer = Timer()
    var totalTime = 0
    var secondspassed = 0
    
    @IBAction func plankSelected(_ sender: UIButton) {
        
        timer.invalidate()
        //when new button is pressed, previous timer is stopped
        
    let plank = sender.currentTitle!
        
    totalTime = plankTimes[plank]!
        
        
        progressBar.progress = 0.0
        // progress bar comes back to 0 whenever new button is pressed
        secondspassed = 0
        // seconds return back to 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func playSound() { let url = Bundle.main.url(forResource: "Alarm", withExtension: "wav")
        audioPLayer = try!AVAudioPlayer(contentsOf: url!)
        audioPLayer.prepareToPlay()
        audioPLayer.play()
        // plays designated sound named Alarm with the extension of wav
    }
    
    @objc func updateTimer() {
        if secondspassed < totalTime {
                secondspassed += 1
            
                progressBar.progress = Float(secondspassed) / Float (totalTime)
            
        } else {
            timer.invalidate()
            playSound()
            
        }
    }



}

