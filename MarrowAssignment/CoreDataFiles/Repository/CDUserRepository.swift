//
//  CDUserRepository.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation
import CoreData

protocol CDUserDelegate : AnyObject{
    func Create(user : UserModel)
    func getUserByEmail(email : String) -> CDUser?
}

class CDUserRepository : CDUserDelegate {
    
    func getUserByEmail(email: String) -> CDUser? {
        let request = NSFetchRequest<CDUser>(entityName: "CDUser")
        request.predicate = NSPredicate(format: "email == %@", email)
        let result = try? PersistantStorage.shared.context.fetch(request).first
        return result
    }
    
    
    func Create(user: UserModel) {
        let cdUser = CDUser(context: PersistantStorage.shared.context)
        cdUser.country = user.country
        cdUser.email = user.email
        cdUser.password = user.password
        PersistantStorage.shared.saveContext()
    }
    
    
    
    
    
    
}
