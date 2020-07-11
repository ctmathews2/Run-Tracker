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
    @IBOutlet weak var timeLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*Auth.auth().signIn(withEmail: "1@2.com", password: "123456") {(user, error) in
            if error != nil {
                print(error!)
            }
        }*/
        myDatabase.setValue("Hello World!")
        timeLabel?.text = "Hello World"
        tracker.start()
        
    }
    
    @objc func updateTimer(){
        tracker.seconds += 1
        timeLabel?.text = "Seconds: \(tracker.seconds)"
        print("Seconds: \(tracker.seconds)")
        if tracker.seconds == 10 {
            tracker.stopTimer()
        }
    }
    
}

