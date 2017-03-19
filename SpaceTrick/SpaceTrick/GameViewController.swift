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

    var currentMaxAccelX: Double = 0.0
    var currentMaxAccelY: Double = 0.0
    var currentMaxAccelZ: Double = 0.0
    var currentMaxRotX: Double = 0.0
    var currentMaxRotY: Double = 0.0
    var currentMaxRotZ: Double = 0.0
    
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
        
        /*
        motionManager.startGyroUpdates(to: OperationQueue.current!, withHandler: { (gyroData: CMGyroData?, NSError) -> Void in
            self.outputRotData(rotation: gyroData!.rotationRate)
            if (NSError != nil){
                print("\(NSError)")
            }
        })
         */
    }
    
    func outputAccData(acceleration: CMAcceleration){
        // print( "Acc X : \(acceleration.x).2fg" )
        // print( "Acc Y : \(acceleration.y).2fg" )
        // print( "Acc Z : \(acceleration.z).2fg" )
        
        print(String(format: "Y variation : %.2f", acceleration.y))
        
        print( "======================" )
        
        /*
         if fabs(acceleration.x) > fabs(currentMaxAccelX)
         {
         currentMaxAccelX = acceleration.x
         }
         if fabs(acceleration.y) > fabs(currentMaxAccelY)
         {
         currentMaxAccelY = acceleration.y
         }
         if fabs(acceleration.z) > fabs(currentMaxAccelZ)
         {
         currentMaxAccelZ = acceleration.z
         }
         
        maxAccX?.text = "\(currentMaxAccelX).2f"
        maxAccY?.text = "\(currentMaxAccelY).2f"
        maxAccZ?.text = "\(currentMaxAccelZ).2f"
        */
    }
    
    func outputRotData(rotation: CMRotationRate){
        print( "Rot X : \(rotation.x).2fr/s" )
        print( "Rot Y : \(rotation.y).2fr/s" )
        print( "Rot Z : \(rotation.z).2fr/s" )
        
        /*
        if fabs(rotation.x) > fabs(currentMaxRotX) {
            currentMaxRotX = rotation.x
        }
        
        if fabs(rotation.y) > fabs(currentMaxRotY) {
            currentMaxRotY = rotation.y
        }
        
        if fabs(rotation.z) > fabs(currentMaxRotZ) {
            currentMaxRotZ = rotation.z
        }
        
        
        maxRotX?.text = "\(currentMaxRotX).2f"
        maxRotY?.text = "\(currentMaxRotY).2f"
        maxRotZ?.text = "\(currentMaxRotZ).2f"
         */
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
