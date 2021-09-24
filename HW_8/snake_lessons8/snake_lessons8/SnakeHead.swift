//
//  SnakeHead.swift
//  SnakeHead
//
//  Created by MICHAIL SHAKHVOROSTOV on 21.09.2021.
//

import UIKit


class SnakeHead: SnakeBodyPart {
    override init(atPOint point: CGPoint) {
        super.init(atPOint: point)
        
        self.physicsBody?.categoryBitMask = CollisionCategory.SnakeHead
        
        self.physicsBody?.contactTestBitMask = CollisionCategory.EdgeBody | CollisionCategory.Snake | CollisionCategory.Apple
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
