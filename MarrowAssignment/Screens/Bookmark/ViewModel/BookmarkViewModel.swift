//
//  BookmarkViewModel.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation

class BookmarkViewModel{
    
    // MARK: GET_ALL_BOOKMARK_METHOD
    func getAllBookmarks() -> [BookModel]{
        return CDBookmarkRepositoryManager.shared.getAllBookmarks()
    }
    
    // MARK: DELETE_BOOKMARK_METHOD_FROM_COREDATA
    func deleteBookmark(title : String){
        CDBookmarkRepositoryManager.shared.deleteBookmark(title: title)
    }
    
}
