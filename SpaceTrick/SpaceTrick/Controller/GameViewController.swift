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
    
    // var accelerometer = Accelerometer()
    
    var _sceneView: SCNView?
    var _level: TutorialLevel2?
    
    // MARK: - Swipe gestures
    
    func handleSwipe(_ gestureRecognize: UISwipeGestureRecognizer) {
        if (gestureRecognize.direction == .left) {
            _level!.swipeLeft()
        }
        else if (gestureRecognize.direction == .right) {
            _level!.swipeRight()
        }
    }
    
    // MARK: pragma mark - Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _level = TutorialLevel2()
        _level!.create()
        _sceneView = SCNView()
        _sceneView!.scene = _level
        _sceneView!.allowsCameraControl = false
        _sceneView!.showsStatistics = true
        _sceneView!.backgroundColor = UIColor.black
        _sceneView!.debugOptions = .showWireframe
        self.view = _sceneView
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeftGesture.direction = .left
        _sceneView!.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRightGesture.direction = .right
        _sceneView!.addGestureRecognizer(swipeRightGesture)
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
