//
//  ViewController.swift
//  AudioPlayer
//
//  Created by The book Air on 18/09/2019.
//  Copyright © 2019 jisung. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
     let audioPath = Bundle.main.path(forResource: "sheep", ofType: "mp3")
    
    var timer = Timer()
    
    @objc func updateProgressBar(){
        
        progressSlider.value = Float(player.currentTime)
        
    }
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    
    @IBAction func play(_ sender: Any) {
        
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateProgressBar), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func pause(_ sender: Any) {
        
        player.pause()
        
        timer.invalidate()
    }
    
    @IBAction func slider(_ sender: Any) {
        
        player.volume = sliderOutlet.value
    }
    
    @IBAction func progress(_ sender: Any) {
        
        player.currentTime = TimeInterval(progressSlider.value)
        
       // progressSlider.value = player.
    }
    
    @IBAction func stop(_ sender: Any) {
        
        progressSlider.value = 0
        
        timer.invalidate()
        
        player.pause()
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            //progressSlider.maximumValue = Float(player.duration)
            
        } catch {
            
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            progressSlider.maximumValue = Float(player.duration)
            
        } catch {
            
        }
    }


}

