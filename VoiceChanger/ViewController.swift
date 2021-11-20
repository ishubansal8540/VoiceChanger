//
//  ViewController.swift
//  VoiceChanger
//
//  Created by Ishu Bansal on 18/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecording: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stopRecording.isEnabled = false

    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
      
    }
    
    @IBAction func recordAudio(_ sender: Any) {
        
        recordingLabel.text = "Recording in progress"
        
        recordButton.isEnabled = false
        stopRecording.isEnabled = true
        recordingLabel.text = "Recording in progress"
        
    }
    
    @IBAction func stopRecording(_ sender: Any) {
       
        recordButton.isEnabled = true
        stopRecording.isEnabled = false
        recordingLabel.text = "Tap to record"
    }
    
}

