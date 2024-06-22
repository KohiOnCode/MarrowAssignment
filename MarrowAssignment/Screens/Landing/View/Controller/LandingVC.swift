//
//  ViewController.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 20/06/24.
//

import UIKit

class LandingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: SignUp_Button_Action
    
    @IBAction func signupBtnAction(_ sender: UIButton) {
        self.NavigateToNextVC(storyboard: "Login", viewController: "SignupVC")
    }
    
    // MARK: Login_Button_Action
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        self.NavigateToNextVC(storyboard: "Login", viewController: "LoginVC")
    }
    
    
}

