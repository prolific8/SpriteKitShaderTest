//
//  GameScene.swift
//  test
//
//  Created by Chris Pelling on 13/04/2018.
//  Copyright © 2018 Compelling. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    override func didMove(to view: SKView) {
        print("Presenting new scene")
        let bg = SKSpriteNode(color: .clear, size: self.frame.size)
        bg.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        let shader = SKShader(fileNamed: "Starfield.fsh")
        
        bg.shader = shader
        addChild(bg)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
 
    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {
        let transition = SKTransition.fade(withDuration: 3)
        let newScene = GameScene()
        self.view?.presentScene(newScene, transition:transition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
