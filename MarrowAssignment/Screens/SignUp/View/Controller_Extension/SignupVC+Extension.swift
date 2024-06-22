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
        LocalStore.shared.defaultCountry = row
    }
    
}

extension SignupVC : fetchCountryDelegate{
    func AllCountries(countries: [String]) {
        countriesArr = countries
        DispatchQueue.main.async {
            self.countryPicker.reloadAllComponents()
        }
    }
}
