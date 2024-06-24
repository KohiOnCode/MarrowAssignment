//
//  ValidationManager.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation

class ValidationManager{
    
    // MARK: Email_Validation
    
    func isValidEmail(_ email: String?) -> ValidationErrors {
        
        guard let email = email, !email.isEmpty else{ return .emptyEmail}
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailPred.evaluate(with: email){
            return .success
        }
        else{
            return .invalidEmail
        }
    }
    
    // MARK: Password_Validation
    
    func ISValidPassword(_ password: String?) -> ValidationErrors{
        
        guard let password = password, !password.isEmpty else{
            return .emptyPassword
        }
        
        let passwordRegEx = "^(?=.*[0-9])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).{8,}$"
        let passPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        if passPred.evaluate(with: password){
            return .success
        }
        else{
            return .invalidPassword
        }
        return .success
    }
    
    // MARK: Country_Validation
    
    func ISValidCountry(_ country: String?) -> ValidationErrors{
        
        guard let country = country, !country.isEmpty else{
            return .emptyCountry
        }
        return .success
    }
    
    // MARK: Login_Validation
    
    func validateLogin(user : UserModel) -> ValidationErrors{
        if isValidEmail(user.email) != .success{
            return isValidEmail(user.email)
        }
        else if ISValidPassword(user.password) != .success{
            return ISValidPassword(user.password)
        }
        return .success
    }
    
    // MARK: Register_Validation
    
    func validateRegister(user : UserModel) -> ValidationErrors{
        if isValidEmail(user.email) != .success{
            return isValidEmail(user.email)
        }
        else if ISValidPassword(user.password) != .success{
            return ISValidPassword(user.password)
        }
        if ISValidCountry(user.country) != .success{
            return ISValidCountry(user.country)
        }
        return .success
    }
    
    func containsUppercaseLetter(_ password: String) -> Bool {
        return password.rangeOfCharacter(from: .uppercaseLetters) != nil
    }

 
    func containsSpecialCharacter(_ password: String) -> Bool {
        let specialCharacterSet = CharacterSet(charactersIn: "!@#$%^&*()-_=+[{]};:'\"<>,.?/")
        return password.rangeOfCharacter(from: specialCharacterSet) != nil
    }
    
}


