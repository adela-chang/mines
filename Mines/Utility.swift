//
//  Utility.swift
//  Mines
//
//  Created by Adela Chang on 10/7/14.
//  Copyright (c) 2014 Squirrel, Inc. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

class Utility: NSObject {

     class func vibratePhone() {
        if(UIDevice.currentDevice().model == "iPhone")
        {
            //AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate)) //works ALWAYS as of this post
            AudioServicesPlayAlertSound (1105);
        }
        else
        {
            // Not an iPhone, so doesn't have vibrate
            // play the less annoying tick noise or one of your own
            AudioServicesPlayAlertSound (1105);
        }
    }
}