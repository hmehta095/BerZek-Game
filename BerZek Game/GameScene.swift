//
//  GameScene.swift
//  BerZek Game
//
//  Created by Himanshu Mehta on 2019-10-10.
//  Copyright © 2019 Himanshu Mehta. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    // MARK: outlet of the player
    var player:SKSpriteNode!
    let PLAYER_SPEED:CGFloat = 20
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        self.player = self.childNode(withName: "player") as! SKSpriteNode
        
        //
        //        // setup physics for the player
        //        self.player.physicsBody = SKPhysicsBody(edgeFrom: <#T##CGPoint#>, to: <#T##CGPoint#>)
        //
        //        self.player.physicsBody?.categoryBitMask = 1
        //        self.player.physicsBody?.collisionBitMask = 4
        //        self.player.physicsBody?.contactTestBitMask = 10
        let moveLeftAction = SKAction.moveBy(
            x: -400, y: 0, duration: 15)
        self.enumerateChildNodes(withName: "enemy") {
            (node, stop) in
            let enemy = node as! SKSpriteNode
            enemy.run(moveLeftAction)
        }
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if (nodeA == nil || nodeB == nil) {
            return
        }
        
        
        
        if(nodeA!.name == "enemy" && nodeB!.name == "player"){
            player.position = CGPoint(x:96, y:220)
        }
        if(nodeA!.name == "player" && nodeB!.name == "enemy"){
            player.position = CGPoint(x:96, y:220)
        }
        
        if(nodeA!.name == "exit" && nodeB!.name == "player"){
            print("GAME WIN")
        }
        
        print("COLLISION DETECTED")
        print("Sprite 1: \(nodeA!.name)")
        print("Sprite 2: \(nodeB!.name)")
        print("------")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
//        Getting the mouse touched
        let mouseTouch = touches.first
        if(mouseTouch==nil){
            return
        }
        
        let location = mouseTouch!.location(in: self)
        
        let nodeTouched = atPoint(location).name
        print("Player touched: \(nodeTouched)")
    
    
    if (nodeTouched == "upButton"){
    self.player.position.y = self.player.position.y + PLAYER_SPEED
    }
    else if(nodeTouched == "downButton"){
    self.player.position.y = self.player.position.y - PLAYER_SPEED
    }
    else if(nodeTouched == "leftButton"){
    self.player.position.x = self.player.position.x - PLAYER_SPEED
    }
    else if(nodeTouched == "rightButton"){
    self.player.position.x = self.player.position.x + PLAYER_SPEED
    }
    
    
    
    }
    
    
}
