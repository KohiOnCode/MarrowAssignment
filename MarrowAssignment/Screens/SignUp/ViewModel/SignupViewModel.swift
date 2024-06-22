//
//  SignupViewModel.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation

protocol fetchCountryDelegate : AnyObject{
    func AllCountries(countries : [String])
}


class SignupViewModel {
    
    // MARK: VARIABLES & CONSTANTS
    
    weak var delegate : fetchCountryDelegate?
    var countiesArr : [String] = []
    let validationManager = ValidationManager()
    
    // MARK: REGISTER_USER_METHOD
    
    func Register(user : UserModel) -> ValidationErrors{
        let valid = validationManager.validateRegister(user: user)
        if valid == .success{
            if let registeredMAil = CDUserRepositoryManager.shared.getUserByEmail(email: user.email.lowercased())?.email{
                return .alreadyRegistered
            }
            else{
                CDUserRepositoryManager.shared.Create(user: user)
                return .registerSuccess
            }
        }
        else{
            return valid
        }
    }
    
    // MARK: FETCH_CURRENT_DEFAULT_COUNTRY
    
    func currentCountry() -> String{
        guard let countries = LocalStore.shared.countryArr else { return ""}
        guard let country = LocalStore.shared.defaultCountry else { return ""}
        return countries[country]
    }
    
    // MARK: FETCH_ALL_COUNTRIES_METHOD
    
    func fetchCountries(){
        if let arr = LocalStore.shared.countryArr{
            delegate?.AllCountries(countries: arr)
        }
        else{
            Webservices.shared.fetchAPI(_APIurl: APIS.countryAPI, resultType: CountryModel.self) {[weak self] result in
                result.data.forEach { (key,value) in
                    self?.countiesArr.append(value.country)
                }
                LocalStore.shared.countryArr = self?.countiesArr.sorted()
                self?.delegate?.AllCountries(countries: LocalStore.shared.countryArr ?? [])
            }
        }
    }
    
}
