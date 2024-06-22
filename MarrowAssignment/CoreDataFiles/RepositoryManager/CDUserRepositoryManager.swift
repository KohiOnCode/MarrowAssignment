//
//  CDUserRepositoryManager.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation

final class CDUserRepositoryManager : CDUserDelegate{
    
    static let shared = CDUserRepositoryManager()
    
    private init(){
        
    }
    
    var userRepository = CDUserRepository()
    
    // MARK: Create_User_CoreData
    
    func Create(user: UserModel) {
        userRepository.Create(user: user)
    }
    
    // MARK: Get_User_By_Email
    
    func getUserByEmail(email: String) -> CDUser? {
        userRepository.getUserByEmail(email: email)
    }
 
}
