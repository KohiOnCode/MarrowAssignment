//
//  Viewcontroller+Alertcontroller.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation
import UIKit

extension UIViewController{
    
    func ShowAlert(mesaage:String){
        let alertController = UIAlertController(title: "Alert", message: mesaage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    func showAlertWithAction(_ title: String, message: String, buttons: [String], alertStyle: UIAlertController.Style = .alert, view: UIView = UIView(), completion: ((Int) -> Void)?) {
        let alertView: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for i in 0..<buttons.count {
            alertView.addAction(UIAlertAction(title: buttons[i], style: .default, handler: {(_ action: UIAlertAction) -> Void in
                if completion != nil {
                    completion!(i)
                }
            }))
        }
        if let popoverController = alertView.popoverPresentationController {
            popoverController.sourceView = view
            popoverController.sourceRect = view.frame
            popoverController.permittedArrowDirections = []
        }
        UIApplication.shared.keyWindow?.rootViewController!.present(alertView, animated: true, completion: nil)
    }

}
