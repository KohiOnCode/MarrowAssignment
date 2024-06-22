//
//  UIViewController + Navigation.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 20/06/24.
//

import Foundation
import UIKit

extension UIViewController{
    
    func NavigateToNextVC(storyboard : String, viewController : String){
        let storyBoard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: viewController)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
