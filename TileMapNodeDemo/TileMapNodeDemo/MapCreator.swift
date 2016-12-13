//
//  MapCreator.swift
//  TileMapNodeDemo
//
//  Created by Daniel Colnaghi on 13/12/16.
//  Copyright © 2016 Cold Mass Digital Entertainment. All rights reserved.
//

import SpriteKit

class MapCreator {
    
    class func createMap(map : SKTileMapNode) -> SKTileMapNode {
        let tileSize = map.tileSize
        let halfWidth = CGFloat(map.numberOfColumns) / 2.0 * tileSize.width
        let halfHeight = CGFloat(map.numberOfRows) / 2.0 * tileSize.height
        
        for row in 0..<map.numberOfRows {
            
            var lastnode : SKShapeNode?
            var lastcol = 0
            
            for col in 0..<map.numberOfColumns {
                let tile = map.tileDefinition(atColumn: col, row: row)
                
                if let _ = tile?.userData?.value(forKey: "solid") {
                    
                    var createNode = false
                    
                    if lastnode == nil {
                        createNode = true
                        lastcol = col
                    } else {
                        
                        if col == (lastcol + 1) {
                            createNode = false
                            lastcol = col
                            
                            lastnode?.xScale += 1
                            lastnode?.calculateAccumulatedFrame()
                        } else {
                            createNode = true
                            lastcol = col
                        }
                    }
                    
                    if createNode {

                        
                        let x = CGFloat(col) * tileSize.width - halfWidth
                        let y = CGFloat(row) * tileSize.height - halfHeight
                        let rect = CGRect(x: 0, y: 0, width: tileSize.width, height: tileSize.height)
                        let rectPhysic = CGSize(width: tileSize.width, height: tileSize.height)
                        
                        let tileNode = SKShapeNode(rect: rect)
                        tileNode.name = "physicnode"
                        tileNode.fillColor = UIColor.clear
                        tileNode.strokeColor = UIColor.clear
                        tileNode.zPosition = 5
                        tileNode.position = CGPoint(x: x, y: y)
                        
                        tileNode.physicsBody = SKPhysicsBody.init(rectangleOf: rectPhysic,
                                                                  center: CGPoint(x: tileSize.width / 2.0,
                                                                                  y: (tileSize.height / 2.0)))
                        
                        tileNode.physicsBody?.affectedByGravity = false
                        tileNode.physicsBody?.isDynamic = false
                        tileNode.physicsBody?.pinned = false
                        tileNode.physicsBody?.collisionBitMask = 0
                        tileNode.physicsBody?.categoryBitMask = 1
                        tileNode.physicsBody?.restitution = 0
                        tileNode.physicsBody?.friction = 0
                        
                        map.addChild(tileNode)
                        
                        lastnode = tileNode
                    }
                }
            }
        }
        
        return map
    }
    
}
