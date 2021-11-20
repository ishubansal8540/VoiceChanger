//
//  RecordSoundViewController.swift
//  VoiceChanger
//
//  Created by Ishu Bansal on 18/11/21.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController,AVAudioRecorderDelegate {

    var audioRecorder: AVAudioRecorder!
    
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
        
        // this is the code use for recording audio
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
            let recordingName = "recordedVoice.wav"
            let pathArray = [dirPath, recordingName]
            let filePath = URL(string: pathArray.joined(separator: "/"))

            let session = AVAudioSession.sharedInstance()
            try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

            try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        
        audioRecorder.delegate = self
            audioRecorder.isMeteringEnabled = true
            audioRecorder.prepareToRecord()
            audioRecorder.record()
        
        // upto here
    }
    
    @IBAction func stopRecording(_ sender: Any) {
       
        recordButton.isEnabled = true
        stopRecording.isEnabled = false
        recordingLabel.text = "Tap to record"
        
        
        // here's the code for stoping the recording
        audioRecorder.stop()
          let audioSession = AVAudioSession.sharedInstance()
          try! audioSession.setActive(false)
        // upto here
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if flag{
            
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }
        else
        {
        print("Recording was not successful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording"{
            let playSoundVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundVC.recordedAudioURL = recordedAudioURL
        }
    }
}

