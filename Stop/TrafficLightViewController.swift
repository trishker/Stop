//
//  TrafficLightViewController.swift
//  Stop
//
//  Created by Trish Kernan on 06/01/2017.
//  Copyright © 2017 Trish Kernan. All rights reserved.
//

import UIKit

class TrafficLightViewController: UIViewController {

    var timer = Timer()
    var counter = 10

    @IBOutlet weak var trafficLightImageView: UIImageView!
    @IBOutlet weak var countDownLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        countDownLabel.text = String(counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeLight(_ sender: UITapGestureRecognizer) {
	        trafficLightImageView.image = UIImage(named:"amberlight")
        startCountDown()
    }
    
    func startCountDown() {
        countDownLabel.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TrafficLightViewController.updateCounter), userInfo: nil, repeats: true)
    }

    func updateCounter() {
        if counter > 0 {
            counter-=1
            countDownLabel.text = "\(counter)"
        } else {
            timer.invalidate()
            countDownLabel.isHidden = true
            counter=10
            countDownLabel.text = "\(counter)"
            trafficLightImageView.image = UIImage(named:"greenlight")
            delayWithSeconds(5, completion: {
                self.trafficLightImageView.image = UIImage(named:"redlight")
            })
        }
    }

    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
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
