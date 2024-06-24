//
//  SignupVC+Extension.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 22/06/24.
//

import Foundation
import UIKit

extension SignupVC : UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countriesArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countriesArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        selectedCountry = countriesArr[row]
    }
    
}

extension SignupVC : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let password = (currentText as NSString).replacingCharacters(in: range, with: string)
        lengthPasswordCheckBoxBtn.setCheckBoxUI(value: password.count >= 8)
        specialCharCheckBoxBtn.setCheckBoxUI(value: signupVM?.checkPasswordFldContainsSpecialCharacter(password) ?? false)
        uppercaseLetterCheckBoxBtn.setCheckBoxUI(value: signupVM?.checkPasswordFldContainsUppercaseLetter(password) ?? false)
        return true
    }
}


extension SignupVC : fetchCountryDelegate{
    func AllCountries(countries: [String], country: String) {
        self.selectedCountry = country
        self.countriesArr = countries
        DispatchQueue.main.async {
            self.countryPicker.reloadAllComponents()
        }
    }
}
