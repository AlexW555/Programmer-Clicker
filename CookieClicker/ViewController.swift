//
//  ViewController.swift
//  CookieClicker
//
//  Created by Alex Wing on 21/09/2019.
//  Copyright © 2019 Alex Wing. All rights reserved.
//
//Here two toolkits are imported for use
import SpriteKit
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numOfInternsLabel: UILabel!
    private var numberOfIntern = 0
    
    @IBOutlet weak var NumOfCookiesLabel: UILabel!
    private var numberOfCookies = 0
    private var flag = 0
    
    private var state = 0
    private var numberOfClicks = 0
    var timerIsRunning = false

    override func viewDidLoad() {
        super.viewDidLoad()
        //additional setup after loading the view of setting label to default value
        NumOfCookiesLabel.text = "\(numberOfCookies)"
    }

    //This button is one of the first purchases the user can have to help their total.
    //The code checks if the user has the correct amount to buy, then repeats a timer where
    // it adds to the total
    @IBAction func buyIntern(_ sender: Any) {
        if numberOfCookies > 20 {
            numberOfCookies -= 20
            numberOfIntern += 1
            numOfInternsLabel.text = "\(numberOfIntern)"
            print(numberOfIntern)
            print(numberOfCookies)
            let timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(addCookies), userInfo: nil, repeats: true)
            timer.fire()
        }
    }
    
    //This is the code for when the programmer is clicked
    //The programmer can switch between 6 different images
    // In later development this will change to a more efficent method
    @IBAction func clicked(_ sender: AnyObject) {
        switch state {
        case 0:
            sender.setImage(UIImage(named: "2.png"), for: .normal)
            state = 1
        case 1:
            sender.setImage(UIImage(named: "2-2.png"), for: .normal)
            state = 0
        case 2:
            sender.setImage(UIImage(named: "2-3.png"), for: .normal)
            state = 3
        case 3:
            sender.setImage(UIImage(named: "2-4.png"), for: .normal)
            state = 2
        case 4:
            sender.setImage(UIImage(named: "2-5.png"), for: .normal)
            state = 5
        case 5:
            sender.setImage(UIImage(named: "2-6.png"), for: .normal)
            state = 4
        default:
            sender.setImage(UIImage(named: "Image-2.png"), for: .normal)
    }
            // This is a check to see if the timer is already running. The timer
        // is used for checking how many times the user presses the programmer within
        // a set period. If they meet the high threshould the image switches to a more angry programmer
            if timerIsRunning == false {
                startTimer()
            }
        else {
                numberOfClicks += 1
            }
        numberOfCookies += 1
        
        let coloredSquare = UIView()
        coloredSquare.backgroundColor = UIColor.blue;
        
        coloredSquare.frame = CGRect(x: 175, y: 400, width: 50, height: 50)
        self.view.addSubview(coloredSquare)
        
        let final = Int.random(in: 0 ..< 300)
        let rotationNow = Int.random(in: 0 ..< 360)
        
        UIView.animate(withDuration: 1.0, animations: {
            coloredSquare.backgroundColor = UIColor.red;
            coloredSquare.frame = CGRect(x: final, y: -50, width: 50, height: 50)
            coloredSquare.alpha = 0;
            coloredSquare.transform = CGAffineTransform(rotationAngle: CGFloat(rotationNow))
        })
        
        NumOfCookiesLabel.text = "\(numberOfCookies)"
        print(numberOfIntern)
        print(numberOfCookies)
        
    }
    
    //This function is called to add cookies from the intern
    //TODO: Add in passed variable that can set how many cookies can be added so it can be called
    //from multiple functions
    @objc func addCookies(){
        numberOfCookies += 2
        NumOfCookiesLabel.text = "\(numberOfCookies)"
        
        let coloredSquare = UIView()
        
        coloredSquare.backgroundColor = UIColor.blue
        
        coloredSquare.frame = CGRect(x: -50, y: 600, width: 50, height: 50)

        self.view.addSubview(coloredSquare)
        
        
        let rotationNow = Int.random(in: 0 ..< 360)
        
        UIView.animate(withDuration: 1.0, animations: {
            coloredSquare.backgroundColor = UIColor.red;
            coloredSquare.frame = CGRect(x: 400, y: 600, width: 50, height: 50)
            coloredSquare.alpha = 0;
            coloredSquare.transform = CGAffineTransform(rotationAngle: CGFloat(rotationNow))
        })
    }

// This function is the timer. This sets a timer for 3 seconnds and once it is pressed it cannot be
// set itself off again until the first timer has finished. The timer is used to check how many times the user
// clicks the button in a set period. This is used to move the programmer image up the states.
@objc func startTimer() {
    var runCount = 0
    timerIsRunning = true
           
           Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
               print("Time left \(runCount)")
               runCount += 1
            
            if runCount == 3 {
                timer.invalidate()
                if self.numberOfClicks > 15 {
                    //This flag moves the programmer up to the next level.
                    if self.flag == 0 {
                      self.state = 3
                        self.flag = 1
                    }
                    else {
                        self.state = 4
                    }
                }
                self.numberOfClicks = 0
                self.timerIsRunning = false
            }
            
            }
    }
}
    


