//
//  LocalStore.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation

final class LocalStore{
    
    static let shared = LocalStore()
    
    private init(){
        
    }
    
    
    var allCountry : [String:String]?{
        get {
            return UserDefaults.standard.value(forKey: "allCountry") as? [String:String]
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "allCountry")
        }
    }
    
    var savedEmail : String?{
        get {
            return UserDefaults.standard.value(forKey: "savedEmail") as? String
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "savedEmail")
        }
    }
    
    var isLoggedIn : Bool?{
        get {
            return UserDefaults.standard.value(forKey: "isLoggedIn") as? Bool
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "isLoggedIn")
        }
    }
    
}
