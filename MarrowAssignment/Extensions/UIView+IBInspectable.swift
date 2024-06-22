//
//  UIView+IBInspectable.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 20/06/24.
//

import Foundation
import UIKit

extension UIView{
    
    @IBInspectable var cornerRadius : CGFloat{
        get {
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderwidth : CGFloat{
        get {
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColorr : UIColor?{
        get {
            if let color = layer.borderColor{
                return UIColor(cgColor: color)
            }
            return nil
        }
        set{
            if let color = newValue{
                layer.borderColor = newValue?.cgColor
            }
        }
    }
    
}
