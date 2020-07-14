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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*Auth.auth().signIn(withEmail: "1@2.com", password: "123456") {(user, error) in
            if error != nil {
                print(error!)
            }
        }*/
        
        timeLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        timeLabel.textColor = .black
        timeLabel.center = CGPoint(x: 160, y: 284)
        timeLabel.textAlignment = .center
        timeLabel.text = "Hello World"
        self.view.addSubview(timeLabel)
        
        myDatabase.setValue("Hello World!")
        
        tracker.start(label: timeLabel)
    }
    
    @objc func updateTimer(){
        tracker.seconds += 1
        //timeLabel.text = "Seconds: \(tracker.seconds)"
        print("Seconds: \(tracker.seconds)")
        if tracker.seconds == 10 {
            print("Got here")
            tracker.stopTimer()
            tracker.timer?.invalidate()
        }
    }
    
    func testUpdateLabel(){
        tracker.seconds += 1
        timeLabel.text = "Seconds: \(tracker.seconds)"
        print("Seconds: \(tracker.seconds)")
        if tracker.seconds == 10 {
            print("Got here")
            tracker.stopTimer()
            tracker.timer?.invalidate()
        }
    }
    
}

