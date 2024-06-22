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
    
    var countryArr : [String]?{
        get {
            return UserDefaults.standard.value(forKey: "countries") as? [String]
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "countries")
        }
    }
    
    var defaultCountry : Int?{
        get {
            return UserDefaults.standard.value(forKey: "country") as? Int
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "country")
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
