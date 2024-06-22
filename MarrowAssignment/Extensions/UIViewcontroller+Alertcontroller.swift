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
}
