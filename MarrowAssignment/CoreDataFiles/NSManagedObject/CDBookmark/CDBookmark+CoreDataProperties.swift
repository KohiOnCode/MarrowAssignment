//
//  CDBookmark+CoreDataProperties.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//
//

import Foundation
import CoreData


extension CDBookmark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDBookmark> {
        return NSFetchRequest<CDBookmark>(entityName: "CDBookmark")
    }

    @NSManaged public var bookTitle: String?
    @NSManaged public var bookAuthor: String?
    @NSManaged public var bookRating: String?
    @NSManaged public var bookHits: String?
    @NSManaged public var bookImage: String?

}

extension CDBookmark : Identifiable {

}
