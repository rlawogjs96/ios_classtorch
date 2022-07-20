//
//  Gradient.swift
//  Class Torch
//
//  Created by Daniel Kim  on 12/2/19.
//  Copyright © 2019 Daniel Kim . All rights reserved.
//

import Foundation
import UIKit
@IBDesignable

//Gradient View Class
class GradientView: UIView {
    
    //First property: First Color
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    //Second property: Second Color
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
           
           get {
               
               return CAGradientLayer.self
           }
       }
    
    //updateView applies the colors to our view
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map {$0.cgColor}
        
        //Gradient begins in the middle from left to right
        if (isHorizontal) {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        }
        
        //Gradient begins in the middle from top to bottom 
        else {
            layer.startPoint = CGPoint(x: 0.5, y: 0)
            layer.endPoint = CGPoint (x: 0.5, y: 1)
        }
    }
    
   
    
}

