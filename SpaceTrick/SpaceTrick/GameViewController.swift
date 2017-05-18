//
//  GameViewController.swift
//  SpaceTrick
//
//  Created by Kim SAVAROCHE on 19/03/2017.
//  Copyright © 2017 Kim SAVAROCHE. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import CoreMotion

class GameViewController: UIViewController {
    
    var motionManager = CMMotionManager()
    
    // MARK: pragma mark - Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager.gyroUpdateInterval = 0.2
        motionManager.accelerometerUpdateInterval = 0.2
        
        //Start Recording Data
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (accelerometerData: CMAccelerometerData?, NSError) -> Void in
            
            self.outputAccData(acceleration: accelerometerData!.acceleration)
            if(NSError != nil) {
                print("\(NSError)")
            }
        }
    }
    
    func outputAccData(acceleration: CMAcceleration){
        print(String(format: "X variation : %.2f", acceleration.x))
        print(String(format: "Y variation : %.2f", acceleration.y))
        print(String(format: "Z variation : %.2f", acceleration.z))
    }
    
    
    
    
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
}
