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
    
    func start(){
        // 1. Make a new timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: ViewController(),   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    
    func stopTimer(){
      timer?.invalidate()
      timer = nil
    }
    
}
