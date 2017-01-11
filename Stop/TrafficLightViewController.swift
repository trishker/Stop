//
//  TrafficLightViewController.swift
//  Stop
//
//  Created by Trish Kernan on 06/01/2017.
//  Copyright © 2017 Trish Kernan. All rights reserved.
//

import UIKit

class TrafficLightViewController: UIViewController {
    
    @IBOutlet weak var trafficLightImageView: UIImageView!
    @IBOutlet weak var countDownLabel: UILabel!
    
    var timer = Timer()
    
    var counter: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func resetView() {
        print("resetView called")
        if timer.isValid {
            timer.invalidate()
        }
        counter = 10
        trafficLightImageView.image = UIImage(named: "redlight")
        countDownLabel.isHidden = true
    }
    
    @IBAction func resetView(_ sender: UIBarButtonItem) {
        resetView()
    }

    @IBAction func start(_ sender: UITapGestureRecognizer) {
        if (timer.isValid) {return}
        trafficLightImageView.image = UIImage(named: "amberlight")
        startCountDown()
        
    }
    
    func startCountDown() {
        counter = 10
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TrafficLightViewController.updateCounter), userInfo: nil, repeats: true)
    }
    
    func updateCounter() {
        countDownLabel.isHidden = false
        if counter > 0 {
            countDownLabel.text = String(counter)
            counter-=1
        } else if counter == 0 {
            timer.invalidate()
            trafficLightImageView.image = UIImage(named: "greenlight")
            countDownLabel.isHidden = true
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
