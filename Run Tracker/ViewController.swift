//
//  ViewController.swift
//  Run Tracker
//
//  Created by Chandler Mathews on 7/10/20.
//  Copyright © 2020 Chandler Mathews. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    let myDatabase = Database.database().reference()
    let tracker: TrackTime = TrackTime()
    let timeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    // Start button
    let startButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    // Pause button
    let pauseButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Pause", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitleColor(UIColor.black, for: .highlighted)
        button.center = CGPoint(x: 160, y: 304)
        return button
    }()
    // Stop button
    let stopButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*Auth.auth().signIn(withEmail: "1@2.com", password: "123456") {(user, error) in
            if error != nil {
                print(error!)
            }
        }*/
        
        // Time Label
        timeLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        timeLabel.textColor = .black
        timeLabel.center = CGPoint(x: 160, y: 284)
        timeLabel.textAlignment = .center
        timeLabel.text = "Hello World"
        self.view.addSubview(timeLabel)
        
        // Start button
        startButton.setTitle("Start", for: .normal)
        startButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        startButton.setTitleColor(UIColor.blue, for: .normal)
        startButton.setTitleColor(UIColor.black, for: .highlighted)
        startButton.center = CGPoint(x: 160, y: 304)
        self.view.addSubview(startButton)
        
        // Stop button
        stopButton.setTitle("Pause", for: .normal)
        stopButton.addTarget(self, action: #selector(buttonTapped2(_:)), for: .touchUpInside)
        stopButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        stopButton.setTitleColor(UIColor.blue, for: .normal)
        stopButton.setTitleColor(UIColor.black, for: .highlighted)
        stopButton.center = CGPoint(x: 160, y: 344)
        self.view.addSubview(stopButton)
        
        myDatabase.setValue("Hello World!")
        
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton){
       tracker.start(label: timeLabel)
    }
    
    @IBAction func buttonTapped2(_ sender: UIButton){
        tracker.stopTimer(button: sender)
    }
    
}
