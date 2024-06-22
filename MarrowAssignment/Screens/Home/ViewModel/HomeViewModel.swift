//
//  HomeViewModel.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation

protocol AllBooksDelegate : AnyObject{
    func allBooks(books : [BookModel])
}

class HomeViewModel{
    
    // MARK: VARIABLES
    var books : [BookModel] = []
    weak var delegate : AllBooksDelegate?
    var page = -1
    var searchedBook = ""
    
    // MARK: FETCH_ALL_BOOKS_METHOD
    func FetchAllBooks(searchBook : String, limit : Int = 10, offset : Int){
        Webservices.shared.fetchAPI(_APIurl: (APIS.allBooksBaseAPI + "title=\(searchBook)&limit=\(limit)&offset=\(offset)"), resultType: CBooksModel.self) {[weak self] result in
            defer{
                self?.page += 1
                self?.delegate?.allBooks(books: self?.books ?? [])
            }
            if self?.searchedBook != searchBook{
                self?.books = []
            }
            result.docs.forEach { doc in
            autoreleasepool {
                    var docRating = "0"
                    var docHint = "0"
                    if let rating = doc.ratingsAverage{
                        docRating = rating.description
                    }
                    if let hint = doc.alreadyReadCount{
                        docHint = hint.description
                    }
                    
                    let book = BookModel(bookTitle: doc.title, bookAuthor: doc.authorName.joined(separator: ","), bookRating: docRating, bookHits: docHint, bookImage: doc.coverI.description)
                
                    self?.books.append(book)
                }
            }
        }
    }
    
    // MARK: CREATE_BOOKMARK_METHOD
    func CreateBookmark(book : BookModel){
        CDBookmarkRepositoryManager.shared.Create(book: book)
    }
    
    // MARK: METHOD_TO_CHECK_BOOK_IS_BOOKMARKED_OR_NOT
    func CheckIsBookmarked(book : BookModel)->Bool{
        if let title = CDBookmarkRepositoryManager.shared.getBookByTitle(bookTitle: book.bookTitle){
            return true
        }
        else{
            return false
        }
    }
    
    // MARK: UNBOOKMARK_METHOD
    func deleteBookmark(title : String){
        CDBookmarkRepositoryManager.shared.deleteBookmark(title: title)
    }
    
}
