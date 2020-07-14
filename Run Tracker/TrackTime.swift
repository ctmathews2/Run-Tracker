//
//  TrackTime.swift
//  Run Tracker
//
//  Created by Chandler Mathews on 7/11/20.
//  Copyright © 2020 Chandler Mathews. All rights reserved.
//

import Foundation
import UIKit

class TrackTime{
    
    var timer: Timer? = nil
    var seconds: Int = 0
    var minutes: Int = 0
    var hours: Int = 0
    
    func start(label: UILabel){
        // 1. Make a new timer
        //self.timer = Timer.scheduledTimer(timeInterval: 1, target: ViewController(),   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timerValue) in
            if self.timer != nil {
                self.update(label: label)
            }
        })
    }
    
    func update(label: UILabel){
        self.seconds += 1
        label.text = "Seconds: \(self.seconds)"
        print("Seconds: \(self.seconds)")
        if self.seconds == 10 {
            print("Got here")
            self.stopTimer()
        }
    }
    
    func stopTimer(){
        self.timer?.invalidate()
        self.timer = nil
    }
    
}
