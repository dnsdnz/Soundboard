//
//  ViewController.swift
//  soundboard
//
//  Created by MacBook Air on 31.05.2018.
//  Copyright © 2018 Deniz Cakmak. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let soundFilenames = ["blaster-firing","chewy_roar","forcestrong","light-saber-on"]
    
    var audioPlayers = [AVAudioPlayer]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for sound in soundFilenames {
            
            do{
                let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType: "wav")!)

                let audioPlayer =  try AVAudioPlayer(contentsOf: url as URL)
                
                audioPlayers.append(audioPlayer)
              }
                
            catch{
                
                audioPlayers.append(AVAudioPlayer())
            }
    
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.play()
        
        
    }
    
    
    
    

}

