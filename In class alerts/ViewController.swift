//
//  ViewController.swift
//  In class alerts
//
//  Created by Frank Bonura on 2/18/20.
//  Copyright © 2020 Frank Bonura. All rights reserved.
//

import UIKit
import AudioToolbox
class ViewController: UIViewController {

    @IBOutlet weak var usernamefield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func displayAlert(_ sender: Any) {
        //setup alert
        let alert = UIAlertController(title: "Important Update", message: "Frankie is the greatest.",preferredStyle: .alert)
        // add the action
        alert.addAction(UIAlertAction(title:NSLocalizedString("OK", comment: "Default action"), style: . `default`, handler: { _ in}))
        //display the alert
        self.present(alert,animated:true, completion: nil)
        
    }
    
    @IBAction func loginAlert(_ sender: Any) {
    
    let ac = UIAlertController(title: "What is your username?", message: nil, preferredStyle: .alert)
       ac.addTextField()
       let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
       let answer = ac.textFields![0]
    
        
        let alert = UIAlertController(title: "Welcome:", message: answer.text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in }))
        self.present(alert,animated: true, completion: nil)}
           ac.addAction(submitAction)
           present(ac, animated: true)
    }
    
    
    
    @IBAction func playmedia(_ sender: Any) {
        var soundID: SystemSoundID = 0
        let soundFile:String=Bundle.main.path(forResource:"r2-d2,ofType: ",ofType: "wav")!
        let soundURL: NSURL = NSURL(fileURLWithPath: soundFile)
        AudioServicesCreateSystemSoundID(soundURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
        // Vibrate Phone
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}

