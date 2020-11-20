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
    //let timeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let timeLabelHeader = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 10))
    let timeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    let distanceLabelHeader = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let distanceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
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
        
        var labelArray = [UILabel]()
        labelArray = [timeLabelHeader, timeLabel, distanceLabelHeader, distanceLabel]
        for label in labelArray{
            label.font = UIFont.preferredFont(forTextStyle: .footnote)
            label.textColor = .black
            label.textAlignment = .center
            label.backgroundColor = .white
            label.layer.borderColor = UIColor.black.cgColor
            label.layer.borderWidth = 3.0
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 100)])
            switch label {
            case timeLabelHeader:
                label.text = "Time Label Header"
                NSLayoutConstraint.activate([label.widthAnchor.constraint(equalToConstant: 200),
                label.heightAnchor.constraint(equalToConstant: 50)])
            case timeLabel:
                label.text = "Time"
            case distanceLabelHeader:
                label.text = "Distance Label Header"
                NSLayoutConstraint.activate([label.widthAnchor.constraint(equalToConstant: 200),
                label.heightAnchor.constraint(equalToConstant: 50)])
            case distanceLabel:
                label.text = "Distance"
            default:
                label.text = "Label"
            }
            
        }
        
        
        let stackView = UIStackView(arrangedSubviews: labelArray)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([startButton.widthAnchor.constraint(equalToConstant: 100),
        startButton.heightAnchor.constraint(equalToConstant: 100)])
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([stopButton.widthAnchor.constraint(equalToConstant: 100),
        stopButton.heightAnchor.constraint(equalToConstant: 100)])
        let stackView2 = UIStackView()
        stackView2.addArrangedSubview(startButton)
        stackView2.addArrangedSubview(stopButton)
        stackView2.axis = .horizontal
        stackView2.alignment = .firstBaseline
        stackView2.distribution = .fillEqually
        stackView2.spacing = 10
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        //(stackView2.centerYAnchor.constraint(equalTo: stackView.centerYAnchor)).isActive = true
        stackView.addArrangedSubview(stackView2)
        
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        //view.addSubview(stackView2)
        (stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)).isActive = true
        (stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)).isActive = true
        
        // Start button
        startButton.setTitle("Start", for: .normal)
        startButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.setTitleColor(UIColor.black, for: .highlighted)
        startButton.backgroundColor = .black
        //startButton.center = CGPoint(x: 150, y: 750)
        //self.view.addSubview(startButton)
        
        // Stop button
        stopButton.setTitle("Pause", for: .normal)
        stopButton.addTarget(self, action: #selector(buttonTapped2(_:)), for: .touchUpInside)
        stopButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        stopButton.setTitleColor(UIColor.white, for: .normal)
        stopButton.setTitleColor(UIColor.black, for: .highlighted)
        stopButton.backgroundColor = .black
        //stopButton.isEnabled = false
        setDisabled(button: stopButton)
        //stopButton.center = CGPoint(x: 200, y: 750)
        //self.view.addSubview(stopButton)
        
        myDatabase.setValue("Hello World!")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton){
        //startButton.isEnabled = false
        setDisabled(button: startButton)
        //stopButton.isEnabled = true
        setEnabled(button: stopButton)
        tracker.start(label: timeLabel, button: stopButton)
    }
    
    @IBAction func buttonTapped2(_ sender: UIButton){
        setEnabled(button: startButton)
        if(stopButton.titleLabel?.text == "Stop"){
            //stopButton.isEnabled = false
            setDisabled(button: stopButton)
        }
        tracker.stopTimer(button: sender)
    }
    
    func setDisabled(button: UIButton){
        button.isEnabled = false
        button.backgroundColor = .lightGray
    }
    
    func setEnabled(button: UIButton){
        button.isEnabled = true
        button.backgroundColor = .black
    }
    
}
