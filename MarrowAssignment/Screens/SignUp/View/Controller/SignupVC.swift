//
//  SignupVC.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 20/06/24.
//

import UIKit

class SignupVC: UIViewController {
        
    // MARK: OUTLETS
    
    @IBOutlet weak var letsGoBtn: UIButton!
    @IBOutlet weak var countryPicker : UIPickerView!
    @IBOutlet weak var emailTxtFld : UITextField!
    @IBOutlet weak var passwordTxtFld : UITextField!
    
    // MARK: VARIABLES
    
    var countriesArr : [String] = []{
        didSet{
            if let country = LocalStore.shared.defaultCountry{
                countryPicker.selectRow(country, inComponent: 0, animated: true)
            }
        }
    }
    var signupVM : SignupViewModel?
    var passCount = 0
    
    
    // MARK: VIEW_DID_LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCountryPicker()
        signupVM = SignupViewModel()
        signupVM?.delegate = self
        
    }
    
    // MARK: VIEW_WILL_APPEAR
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        signupVM?.fetchCountries()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: SETUP_COUNTRY_PICKER
    
    func setUpCountryPicker(){
        countryPicker.delegate = self
        countryPicker.isHidden = false
        countryPicker.dataSource = self
    }
    
    // MARK: LET'S GO _BUTTON_ACTION
    
    @IBAction func letsgoBtnAction(_ sender : UIButton){
        let user = UserModel(email: emailTxtFld.text?.lowercased() ?? "", password: passwordTxtFld.text ?? "", country: signupVM?.currentCountry() ?? "")
        let validation = signupVM?.Register(user: user)
        if validation == .registerSuccess{
            self.NavigateToNextVC(storyboard: "Login", viewController: "LoginVC")
        }
        else{
            ShowAlert(mesaage: validation?.rawValue ?? "Something went wrong")
        }
    }
    
    
    // MARK: Password_CheckBox_Buttons_Action
    
    @IBAction func passwordValid(_ sender: UIButton) {
        
        if sender.imageView?.image == UIImage(named: "check"){
            sender.setImage(UIImage(named: "uncheck"), for: .normal)
            passCount -= 1
        }
        else{
            sender.setImage(UIImage(named: "check"), for: .normal)
            passCount += 1
            
        }
        
        if passCount == 3{
            letsGoBtn.isEnabled = true
            letsGoBtn.backgroundColor = UIColor(red: 124/255, green: 198/255, blue: 220/255, alpha: 1.0)
        }
        else{
            letsGoBtn.isEnabled = false
            letsGoBtn.backgroundColor = .lightGray
        }
    }
    
    
}

