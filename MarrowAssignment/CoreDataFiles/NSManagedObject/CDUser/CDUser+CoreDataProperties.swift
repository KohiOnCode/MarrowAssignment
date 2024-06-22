//
//  CDUser+CoreDataProperties.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var country: String?

}

extension CDUser : Identifiable {

}
