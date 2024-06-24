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
    
    @IBOutlet weak var lengthPasswordCheckBoxBtn : UIButton!
    @IBOutlet weak var specialCharCheckBoxBtn : UIButton!
    @IBOutlet weak var uppercaseLetterCheckBoxBtn : UIButton!
    
    
    // MARK: VARIABLES
    
    var countriesArr : [String] = []{
        didSet{
            DispatchQueue.main.asyncAfter(deadline: .now()+0.1){
                self.countryPicker.selectRow(self.countriesArr.firstIndex(of: self.selectedCountry) ?? 0, inComponent: 0, animated: false)
                
            }
        }
    }
    
    var signupVM : SignupViewModel?
    var selectedCountry = ""
    
    
    // MARK: VIEW_DID_LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCountryPicker()
        signupVM = SignupViewModel()
        signupVM?.delegate = self
        passwordTxtFld.delegate = self
        
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
        let user = UserModel(email: emailTxtFld.text?.lowercased() ?? "", password: passwordTxtFld.text ?? "", country: selectedCountry)
        let validation = signupVM?.Register(user: user)
        if validation == .registerSuccess{
            self.NavigateToNextVC(storyboard: "Main", viewController: "HomeVC")
        }
        else{
            ShowAlert(mesaage: validation?.rawValue ?? "Something went wrong")
        }
    }
    
}




