//
//  ViewController.swift
//  Mines
//
//  Created by Adela Chang on 10/7/14.
//  Copyright (c) 2014 Squirrel, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        let controller = TestViewController(nibName: "TestViewController", bundle: nil)
        self.presentViewController(controller, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

