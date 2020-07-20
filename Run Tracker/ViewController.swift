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
        
        //Array
        let labelArray = [label1, label2]
        
        let stackView = UIStackView(arrangedSubviews: labelArray)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        (stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)).isActive = true
        (stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)).isActive = true
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
    
    // Make closures for each label here
    let label1: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Label 1"
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Label 1"
        return label
    }()
   
    
    // add them to a stackview? or atleast a new view
    
    
    //
    // add that view to main view
    // make constraints for the view
    
    
}
