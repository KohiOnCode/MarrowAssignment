//
//  CDBookmarkRepositoryManager.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation
import CoreData

final class CDBookmarkRepositoryManager : CDBookmarkDelegate{
    
    private var repository = CDBookmarkRepository()
    
    static let shared = CDBookmarkRepositoryManager()
    
    private init(){

    }
    
    // MARK: Create_Bookmark_CoreData
    
    func Create(book: BookModel) {
        repository.Create(book: book)
    }
    
    // MARK: Get_Book_By_BookTitle
    
    func getBookByTitle(bookTitle: String) -> CDBookmark? {
        repository.getBookByTitle(bookTitle: bookTitle)
    }
    
    // MARK: Delete_Book_By_BookTitle
    
    func deleteBookmark(title: String) {
        repository.deleteBookmark(title: title)
    }
    
    // MARK: Get_All_Bookmarks
    
    func getAllBookmarks() -> [BookModel] {
        repository.getAllBookmarks()
    }
    
    // MARK: Delete_All_Bookmarks
    
    func deleteAllData() {
        repository.deleteAllData()
    }
    
}
