//
//  ViewController.swift
//  Kit
//
//  Created by  DNS on 03.09.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //outlet
    
    @IBOutlet weak var sliderBoard: UISlider!
    
    var player = AVAudioPlayer()
    let slider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //slider
        self.slider.frame = CGRect(x: 0, y: 0, width: 200, height: 23)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        self.view.addSubview(slider)
        
        //addTarget
        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        do {
            if let audioPath = Bundle.main.path(forResource: "oh_rana", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("ERROR")
        }
        self.player.play()
    }
    
    //MARK:  - Method
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    
    //MARK: - Action
    @IBAction func PlayBotton(_ sender: Any) {
        self.player.play()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        self.player.pause()
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        self.player.volume = sliderBoard.value
    }
    
}
