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
    
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBAction func play(_ sender: Any) {
        
        player.play()
    }
    
    
    @IBAction func pause(_ sender: Any) {
        
        player.pause()
    }
    
    @IBAction func slider(_ sender: Any) {
        
        player.volume = sliderOutlet.value
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let audioPath = Bundle.main.path(forResource: "sheep", ofType: "mp3")
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch {
            
        }
    }


}

