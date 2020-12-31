//
//  ViewController.swift
//  Run Tracker
//
//  Created by Chandler Mathews on 7/10/20.
//  Copyright © 2020 Chandler Mathews. All rights reserved.
//

/* TODO:
 * Text inside boxes
 * Track Distance
 * Pop up after stop with time distance and pace
 * ... Set up nav bar and history page?
 */

import UIKit
import Firebase
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let myDatabase = Database.database().reference()
    let tracker: TrackTime = TrackTime()
    
    let timeLabelHeader = UILabel(), timeLabel = UILabel(), distanceLabelHeader = UILabel(), distanceLabel = UILabel()
    let startButton = UIButton(), stopButton = UIButton()
    
    var locationManager: CLLocationManager?
    
    var firstCord : CLLocation? = nil
    var lastCord : CLLocation? = nil
    var distanceInMeters : double_t = 0
    var tracking : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*Auth.auth().signIn(withEmail: "1@2.com", password: "123456") {(user, error) in
            if error != nil {
                print(error!)
            }
        }*/
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        
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
                label.text = "Time"
                NSLayoutConstraint.activate([label.widthAnchor.constraint(equalToConstant: 200),
                label.heightAnchor.constraint(equalToConstant: 50)])
            case timeLabel:
                label.text = "00:00"
            case distanceLabelHeader:
                label.text = "Distance (miles)"
                NSLayoutConstraint.activate([label.widthAnchor.constraint(equalToConstant: 200),
                label.heightAnchor.constraint(equalToConstant: 50)])
            case distanceLabel:
                label.text = "0.00"
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
        tracking = true
    }
    
    @IBAction func buttonTapped2(_ sender: UIButton){
        setEnabled(button: startButton)
        if(stopButton.titleLabel?.text == "Stop"){
            //stopButton.isEnabled = false
            distanceInMeters = 0
            setDisabled(button: stopButton)
            
        }
        tracking = false
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
    
    // Tracking distance
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            // you're good to go!
            print("Now tracking location")
            locationManager!.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.startUpdatingLocation()
        } else {
            print("Not allowed to track location")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            if firstCord == nil {
                firstCord = location
            }
            
            lastCord = location
            if tracking == true {
                distanceInMeters += firstCord!.distance(from: lastCord!)
                distanceLabel.text = String(((distanceInMeters*0.000621371)*100).rounded() / 100)
            }
            firstCord = lastCord
            
        }
    }
    
}
