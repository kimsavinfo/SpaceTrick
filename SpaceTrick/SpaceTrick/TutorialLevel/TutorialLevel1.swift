//
//  TutorialLevel1.swift
//  SpaceTrick
//
//  Created by Kim SAVAROCHE on 14/06/2017.
//  Copyright © 2017 Kim SAVAROCHE. All rights reserved.
//

import UIKit
import SceneKit

class TutorialLevel1: SCNScene, SCNSceneRendererDelegate, SCNPhysicsContactDelegate {
    private let levelWidth = 320
    private let levelLength = 320
    
    private var _terrain: Terrain?
    private var _player: Player?

    // MARK: - Place objects
    
    private func addPlayer() {
        _player = Player()
        _player!.position = SCNVector3(160, 3, 0)
        self.rootNode.addChildNode(_player!)
        
        let moveAction = SCNAction.moveBy(x: 0, y: 0, z: 200, duration: 20)
        _player!.runAction(moveAction)
    }
    
    private func addTerrain() {
        _terrain = Terrain(width: levelWidth, length: levelLength, scale: 128)
        
        let generator = PerlinNoiseGenerator(seed: nil)
        _terrain?.formula = {(x: Int32, y: Int32) in
            return generator.valueFor(x: x, y: y)
        }
        
        _terrain!.create(withColor: UIColor.green)
        _terrain!.position = SCNVector3Make(0, 0, 0)
        self.rootNode.addChildNode(_terrain!)
    }
    
    // MARK: - Initialisation
    
    func create() {
        addTerrain()
        addPlayer()
    }
    
    override init() {
        super.init()
    }
    
    required init(coder: NSCoder) {
        fatalError("Not yet implemented")
    }
}
