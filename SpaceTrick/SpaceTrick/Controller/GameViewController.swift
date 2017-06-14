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

class GameViewController: UIViewController {
    
    var accelerometer = Accelerometer()
    
    // MARK: pragma mark - Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    
    
    // MARK: pragma mark - Device settings
    
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
