//
//  TestViewController.swift
//  Run Tracker
//
//  Created by Chandler Mathews on 12/30/20.
//  Copyright © 2020 Chandler Mathews. All rights reserved.
//

import Foundation
import UIKit

class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let test = TestView(frame: CGRect.zero)
        view.addSubview(test)
    }
    
}
