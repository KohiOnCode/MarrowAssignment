//
//  LoginVC.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 20/06/24.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: OUTLETS
    
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    // MARK: VARIABLES
    
    var loginVM : LoginViewModel?
    var passCount = 0
    
    // MARK: VIEW_DID_LOAD

    override func viewDidLoad() {
        super.viewDidLoad()
        loginVM = LoginViewModel()
        
    }
    
    // MARK: LETSGO_BUTTON_ACTION
    
    @IBAction func letsGoBtnAction(_ sender: UIButton) {
        let user = UserModel(email: emailTxtFld.text?.lowercased() ?? "", password: passwordTxtFld.text ?? "", country: "")
        let validation = loginVM?.Login(user: user)
        if validation == .loginSuccess{
            self.NavigateToNextVC(storyboard: "Main", viewController: "HomeVC")
        } 
        else{
            ShowAlert(mesaage: validation?.rawValue ?? "Something went wrong")
        }
    }

}
