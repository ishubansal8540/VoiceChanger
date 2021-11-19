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
       
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
      
    }
    
    @IBAction func recordAudio(_ sender: Any) {
        
        recordingLabel.text = "Recording in progress"
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text = "Recording is stop"
        
    }
    
}

