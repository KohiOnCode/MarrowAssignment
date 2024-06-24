//
//  CDBookmarkRepository.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation
import CoreData


protocol CDBookmarkDelegate : AnyObject{
    func Create(book : BookModel)
    func getBookByTitle(bookTitle : String) -> CDBookmark?
    func deleteBookmark(title : String)
    func getAllBookmarks()->[BookModel]
    func deleteAllData()
}

class CDBookmarkRepository : CDBookmarkDelegate {
    func getAllBookmarks() -> [BookModel] {
            let result = PersistantStorage.shared.fetchManagedObject(managedObject: CDBookmark.self)
            var books = [BookModel]()
            result?.forEach({ book in
                books.append(book.convertCDBookmarkToBookModel())
            })
            return books
    }
    
    func Create(book: BookModel) {
        let cdBookmark = CDBookmark(context: PersistantStorage.shared.context)
        cdBookmark.bookTitle = book.bookTitle
        cdBookmark.bookAuthor = book.bookAuthor
        cdBookmark.bookRating = book.bookRating
        cdBookmark.bookHits = book.bookHits
        cdBookmark.bookImage = book.bookImage
        PersistantStorage.shared.saveContext()
    }
    
    func getBookByTitle(bookTitle: String) -> CDBookmark? {
        let request = NSFetchRequest<CDBookmark>(entityName: "CDBookmark")
        request.predicate = NSPredicate(format: "bookTitle == %@", bookTitle)
        let result = try? PersistantStorage.shared.context.fetch(request).first
        return result
    }
    
    func deleteBookmark(title: String) {
        guard let cdPerson = getBookByTitle(bookTitle: title) else {return}
        PersistantStorage.shared.context.delete(cdPerson)
        PersistantStorage.shared.saveContext()
    }
    
    func deleteAllData() {
        let context = PersistantStorage.shared.context
            // Fetch all entities and delete them
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CDBookmark")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try context.execute(batchDeleteRequest)
                try context.save()
            } catch {
                print("Error deleting data: \(error)")
            }
        PersistantStorage.shared.saveContext()
        }
    
    
}

extension CDBookmark{
    func convertCDBookmarkToBookModel()->BookModel{
        var book = BookModel(bookTitle: self.bookTitle ?? "", bookAuthor: self.bookAuthor, bookRating: self.bookRating, bookHits: self.bookHits, bookImage: self.bookImage)
        return book
    }
}
