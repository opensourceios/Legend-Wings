//
//  Extensions.swift
//  Angelica Fighti
//
//  Created by Guan Wong on 12/30/16.
//  Copyright © 2016 Wong. All rights reserved.
//

import Foundation
import AVFoundation
import SpriteKit
import UIKit



protocol ProjectileDelegate{
    
    func add(sknode: SKNode)
}

enum GameState{
    case Spawning  // state which waves are incoming
    case BossEncounter // boss encounter
    case WaitingState // Need an state
    case NoState
    case Start
}

enum ProjectileType{
    case type1
    case type2
    case type3
    
}

enum ContactType{
    case HitByEnemy
    case EnemyGotHit
    case PlayerGetCoin
    case Immune
    case None
}



extension SKNode{
    var power:CGFloat!{
        get {
            
            if let v = userData?.value(forKey: "power") as? CGFloat{
                return v
            }
            else{
                print ("Extension SKNode Error for POWER Variable: ",  userData?.value(forKey: "power") ?? -1.0 )
                return -9999.0
            }
            
        }
        set(newValue) {
            userData?.setValue(newValue, forKey: "power")
        }
    }
    
    var hp:CGFloat!{
        get {
            
            if let v = userData?.value(forKey: "hp") as? CGFloat{
                return v
            }
            else{
                print ("Extension SKNode Error for HP Variable: ",  userData?.value(forKey: "hp") ?? -1.0 )
                return -9999.0
            }
            
        }
        
        set(newValue) {
            userData?.setValue(newValue, forKey: "hp")
        }
    }
    
    var maxHp:CGFloat!{
        get {
            
            if let v = userData?.value(forKey: "maxHp") as? CGFloat{
                return v
            }
            else{
                print ("Extension SKNode Error for maxHp Variable: ",  userData?.value(forKey: "maxHp") ?? -1.0 )
                return -9999.0
            }
            
        }
        
        set(newValue) {
            userData?.setValue(newValue, forKey: "maxHp")
        }
    }
    
    var sound:AVAudioPlayer?{
        get {
            
            if let v = userData?.value(forKey: "audio") as? AVAudioPlayer{
                return v
            }
            else{
                print ("Extension SKNode Error for sound Variable: ")
                return nil
            }
            
        }
        
        set(newValue) {
            userData?.setValue(newValue, forKey: "audio")
        }
    }
    
    
}

extension SKScene{
    func removeUIViews(){
            for view in (view?.subviews)! {
                view.removeFromSuperview()
            }
            
    }
    
    func recursiveRemovingSKActions(sknodes:[SKNode]){
        
        for childNode in sknodes{
            childNode.removeAllActions()
            if childNode.children.count > 0 {
                recursiveRemovingSKActions(sknodes: childNode.children)
            }
            
        }
        
    }
}

/*RANDOM FUNCTIONS */

func random() -> CGFloat {
    return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
}

func random( min: CGFloat, max: CGFloat) -> CGFloat {
    return random() * (max - min) + min
}

func randomInt( min: Int, max: Int) -> Int{
    //return randomInt() * (max - min ) + min
    return Int(arc4random_uniform(UInt32(max - min + 1))) + min
}