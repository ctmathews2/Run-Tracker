//
//  TestView.swift
//  Run Tracker
//
//  Created by Chandler Mathews on 12/30/20.
//  Copyright © 2020 Chandler Mathews. All rights reserved.
//

import Foundation
import UIKit

class TestView: UIView {
    var shouldSetupConstraints = true
    
    var label =  UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "Hi there"
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([label.widthAnchor.constraint(equalToConstant: 200),
        label.heightAnchor.constraint(equalToConstant: 100)])
        self.addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func updateConstraints() {
        if(shouldSetupConstraints) {
          // AutoLayout constraints
          shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
}
