//
//  LabelCorners.swift
//  Class Torch
//
//  Created by Daniel Kim  on 12/11/19.
//  Copyright © 2019 Daniel Kim . All rights reserved.
//

import UIKit

@IBDesignable
class LabelCorners: UILabel {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.purple {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
