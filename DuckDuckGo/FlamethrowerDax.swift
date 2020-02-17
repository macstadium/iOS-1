//
//  FlamethrowerDax.swift
//  DuckDuckGo
//
//  Created by Christopher Brind on 17/02/2020.
//  Copyright © 2020 DuckDuckGo. All rights reserved.
//

import UIKit
import SpriteKit

class FlamethrowerDaxView: SKView {

    weak var flames: SKEmitterNode?

    var image: UIImage? {
        didSet {
            if let image = image {
                let imageNode = SKSpriteNode(texture: SKTexture(cgImage: image.cgImage!))
                imageNode.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
                scene?.addChild(imageNode)
                imageNode.run(.sequence([SKAction.wait(forDuration: 0.5),
                                      SKAction.fadeOut(withDuration: 1.0)]))
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.clear

        let scene = SKScene(size: frame.size)
        scene.backgroundColor = UIColor.clear

//        if let flames = SKEmitterNode(fileNamed: "FlamesUp") {
//            self.flames = flames
//            scene.addChild(flames)
//            flames.position = CGPoint(x: frame.size.width / 2, y: 0)
//            flames.particlePositionRange.dx = frame.size.width
//        }

        let dax = SKSpriteNode(imageNamed: "Logo")
        dax.position = CGPoint(x: -dax.size.width, y: dax.size.height - 20)
        dax.zPosition = 10

        if let thrower = SKEmitterNode(fileNamed: "FlamethrowerFlameParticle") {
            thrower.position = CGPoint(x: 42, y: -10)
            dax.addChild(thrower)
        }

        scene.addChild(dax)

        dax.run(.move(by: CGVector(dx: frame.size.width + (dax.size.width * 2), dy: 0), duration: 1.5))

        if let smoke = SKEmitterNode(fileNamed: "SmokeFull") {
            scene.addChild(smoke)
            smoke.position = CGPoint(x: frame.size.width / 2, y: 0)
            smoke.particlePositionRange.dx = frame.size.width            
        }

        presentScene(scene)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class FlamethrowerDaxScene: SKScene {

}
