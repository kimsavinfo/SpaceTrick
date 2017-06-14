//
//  Accelerometer.swift
//  SpaceTrick
//
//  Created by Kim SAVAROCHE on 14/06/2017.
//  Copyright © 2017 Kim SAVAROCHE. All rights reserved.
//

import Foundation
import CoreMotion

class Accelerometer {
    var motionManager = CMMotionManager()

    init() {
        self.motionManager.gyroUpdateInterval = 0.2
        self.motionManager.accelerometerUpdateInterval = 0.2
        
        startUpdating()
    }
    
    func startUpdating() {
        self.motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (accelerometerData: CMAccelerometerData?, NSError) -> Void in
            
            self.outputAccData(acceleration: accelerometerData!.acceleration)
            if(NSError != nil) {
                print("\(String(describing: NSError))")
            }
        }
    }
    
    func outputAccData(acceleration: CMAcceleration){
        print(String(format: "X variation : %.2f", acceleration.x))
        print(String(format: "Y variation : %.2f", acceleration.y))
    }
}
