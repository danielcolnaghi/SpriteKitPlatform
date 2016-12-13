//
//  GameScene.swift
//  TileMapNodeDemo
//
//  Created by Daniel Colnaghi on 12/12/16.
//  Copyright © 2016 Cold Mass Digital Entertainment. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var map : SKTileMapNode?
    
    override func didMove(to view: SKView) {
        
        if let node = self.childNode(withName: "map") as? SKTileMapNode {
            map = MapCreator.createMap(map: node)
            map?.calculateAccumulatedFrame()
        }
        
        if let hero = self.childNode(withName: "hero") as? SKSpriteNode {
            hero.run(SKAction.applyImpulse(CGVector(dx: 100, dy: 10), duration: 2))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let hero = self.childNode(withName: "hero") as? SKSpriteNode {
            hero.removeAllActions()
            hero.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            hero.position = (touches.first?.location(in: self))!
            hero.run(SKAction.applyImpulse(CGVector(dx: 100, dy: 10), duration: 2))
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
