//
//  SignupViewModel.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation

protocol fetchCountryDelegate : AnyObject{
    func AllCountries(countries : [String], country : String)
}


class SignupViewModel {
    
    // MARK: VARIABLES & CONSTANTS
    
    weak var delegate : fetchCountryDelegate?
    var countiesArr : [String] = []
    var defaultCountry = ""
    let validationManager = ValidationManager()
    
    // MARK: REGISTER_USER_METHOD
    
    func Register(user : UserModel) -> ValidationErrors{
        let valid = validationManager.validateRegister(user: user)
        if valid == .success{
            if (CDUserRepositoryManager.shared.getUserByEmail(email: user.email.lowercased())?.email) != nil{
                return .alreadyRegistered
            }
            else{
                CDUserRepositoryManager.shared.Create(user: user)
                CDBookmarkRepositoryManager.shared.deleteAllData()
                LocalStore.shared.savedEmail = user.email
                return .registerSuccess
            }
        }
        else{
            return valid
        }
    }
    
    // MARK: FETCH_CURRENT_DEFAULT_COUNTRY
    
    func currentCountry(){
        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
            defaultCountry = LocalStore.shared.allCountry?[countryCode] ?? ""
        }
    }
    
    // MARK: FETCH_ALL_COUNTRIES_METHOD
    
    func fetchCountries(){
        if var dict = LocalStore.shared.allCountry{
            dict.forEach({countiesArr.append($0.value)})
            currentCountry()
            delegate?.AllCountries(countries: countiesArr.sorted(), country: defaultCountry)
        }
        else{
            LocalStore.shared.allCountry = [:]
            Webservices.shared.fetchAPI(_APIurl: APIS.countryAPI, resultType: CountryModel.self) {[weak self] result in
                result.data.forEach { (key,value) in
                    self?.countiesArr.append(value.country)
                    LocalStore.shared.allCountry?[key] = value.country
                }
                self?.currentCountry()
                self?.delegate?.AllCountries(countries: self?.countiesArr.sorted() ?? [],  country: self?.defaultCountry ?? "")
            }
        }
        
    }
    
    
    
       func checkPasswordFldContainsUppercaseLetter(_ password: String) -> Bool {
           return validationManager.containsUppercaseLetter(password)
       }

    
       func checkPasswordFldContainsSpecialCharacter(_ password: String) -> Bool {
           return validationManager.containsSpecialCharacter(password)
       }
    
    
}
