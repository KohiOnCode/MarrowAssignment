//
//  UIView+Tapgesture.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 20/06/24.
//

import Foundation
import UIKit

extension UIView{
    
    func actionBlock(_ closure: @escaping ()->()){
        let sleeve = ClosureSleeve(closure)
        let tapGesture = UITapGestureRecognizer(target: sleeve, action: #selector(ClosureSleeve.invoke))
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
    
}

class ClosureSleeve {
    let closure: ()->()

    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }

    @objc func invoke () {
        closure()
    }
}


