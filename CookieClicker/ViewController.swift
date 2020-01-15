//
//  ViewController.swift
//  CookieClicker
//
//  Created by Alex Wing on 21/09/2019.
//  Copyright © 2019 Alex Wing. All rights reserved.
//
import SpriteKit
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numOfInternsLabel: UILabel!
    private var numberOfIntern = 0
    
    @IBOutlet weak var NumOfCookiesLabel: UILabel!
    private var numberOfCookies = 0
    
    private var state = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        NumOfCookiesLabel.text = "\(numberOfCookies)"
        // Do any additional setup after loading the view.
    }

    
    
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
    
    @IBAction func clicked(_ sender: AnyObject) {
        switch state {
        case 0:
            sender.setImage(UIImage(named: "2.png"), for: .normal)
            state = 1
        case 1:
            sender.setImage(UIImage(named: "2-2.png"), for: .normal)
            state = 2
        case 2:
        sender.setImage(UIImage(named: "Image-2.png"), for: .normal)
        state = 0
        default:
        sender.setImage(UIImage(named: "Image-2.png"), for: .normal)
        }
        
        var runCount = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("Time left \(runCount)")
            runCount += 1
            
            if runCount == 3 {
                timer.invalidate()
            }
        }
        
//        if (state == 0) {
//            sender.setImage(UIImage(named: "Image-1.png"), for: .normal)
//            state = 1
//        } else {
//            sender.setImage(UIImage(named: "Image-2.png"), for: .normal)
//            state = 0
//        }
        numberOfCookies += 1
        NumOfCookiesLabel.text = "\(numberOfCookies)"
        print(numberOfIntern)
        print(numberOfCookies)
        
    }
    
    
    @objc func addCookies(){
        numberOfCookies += 2
        NumOfCookiesLabel.text = "\(numberOfCookies)"
    }
}

    
    


