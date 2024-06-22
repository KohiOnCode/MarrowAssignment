//
//  ValidationError.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation

enum ValidationErrors : String{
    case invalidPassword = "Password is not valid"
    case emptyEmail = "Email should not be empty"
    case emptyPassword = "Password should not be empty"
    case emptyCountry = "Select a country"
    case success = "Success"
    case alreadyRegistered = "User is already registered with this email address"
    case registerSuccess = "Register Successfully"
    case loginSuccess = "Login Successfully"
    case userNotExist = "User not exist with above credentials"
    case deleted = "Successfully deleted"
    case userNotFoundToDelete = "User with this email not exist"
    
    case invalidEmail = "Please enter a valid email address"
    case smallPassword = "Password must contain 8 letters"    
}
