//
//  TestViewController.swift
//  Mines
//
//  Created by Adela Chang on 10/7/14.
//  Copyright (c) 2014 Squirrel, Inc. All rights reserved.
//

import QuartzCore
import UIKit

class TestViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet var explosionImageView: UIImageView!
    @IBOutlet var deathLabel: UILabel!
    
    // MARK: - IBActions
    @IBAction func animate() {
        deathLabel.text = ""
        explosionImageView.image = UIImage(named: "mines5.png")
        explosionImageView.startAnimating()
        Utility.vibratePhone()
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), { self.showExplodedAlert() })
    }
    
    // MARK: - Native Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setUpAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Initialization
    /// Preps the imageview with explosion images.
    func setUpAnimation() {
        
        let image1 = UIImage(named: "mines1.png")
        let image2 = UIImage(named: "mines2.png")
        let image3 = UIImage(named: "mines3.png")
        let image4 = UIImage(named: "mines4.png")
        let image5 = UIImage(named: "mines5.png")
        
        explosionImageView.animationImages = [image1, image2, image2, image4, image5, image4, image5, image3, image4, image5, image4, image5, image4, image5]
        explosionImageView.animationDuration = 1.5
        explosionImageView!.animationRepeatCount = 1
    }

    func showExplodedAlert() {
        var alert = UIAlertView(title: "BOOM!", message: "You have exploded", delegate: self, cancelButtonTitle: nil, otherButtonTitles: "OK")
        alert.show()
    }

    // MARK: - UIAlertView Delegate Methods
    func alertView(alertView: UIAlertView, willDismissWithButtonIndex buttonIndex: Int) {

        explosionImageView.image = nil
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy 'at' h:mm a" // superset of OP's format
        let date = dateFormatter.stringFromDate(NSDate())

        deathLabel.text = "Killed by Adela Chang on " + date + ". Ha ha!"
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
