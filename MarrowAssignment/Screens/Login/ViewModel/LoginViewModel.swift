//
//  LoginViewModel.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation

class LoginViewModel{
    
    let validationManager = ValidationManager()
    
    // MARK: LOGIN_USER_METHOD
    
    func Login(user : UserModel) -> ValidationErrors{
        if validationManager.validateLogin(user: user) == .success{
                if let registeredUser = CDUserRepositoryManager.shared.getUserByEmail(email: user.email.lowercased()){
                    if registeredUser.email != user.email{
                        return .invalidEmail
                    }
                    else if registeredUser.password != user.password{
                        return .invalidPassword
                    }
                    else {
                        if user.email != LocalStore.shared.savedEmail{
                            CDBookmarkRepositoryManager.shared.deleteAllData()
                            LocalStore.shared.savedEmail = user.email
                        }
                        LocalStore.shared.isLoggedIn = true
                        return .loginSuccess
                    }
                }
                else{
                    return .userNotExist
                }
            }
            else{
                return validationManager.validateLogin(user: user)
            }
        }
     
    
}
