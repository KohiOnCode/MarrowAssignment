//
//  UIButton+CheckBox.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 24/06/24.
//

import Foundation
import UIKit

extension UIButton{
    func setCheckBoxUI(value : Bool){
        if value{
            self.setImage(UIImage(named: "check"), for: .normal)
        }
        else{
            self.setImage(UIImage(named: "uncheck"), for: .normal)
        }
    }
}
