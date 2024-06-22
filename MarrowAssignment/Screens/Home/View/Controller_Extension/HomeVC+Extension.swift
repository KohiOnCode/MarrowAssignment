//
//  HomeVC+Extension.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 22/06/24.
//

import Foundation
import UIKit

// MARK: COLLECTIONVIEW_DELEGATE_DATASOURCES

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortCategoryArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sortCollectionVw.dequeueReusableCell(withReuseIdentifier: "SortCVCell", for: indexPath) as! SortCVCell
        cell.sortLbl.text = sortCategoryArr[indexPath.item]
        
        if indexPath.item == selectedSortIndex{
            cell.cellVw.backgroundColor = .lightGray
            cell.cellVw.clipsToBounds = true
            cell.cellVw.layer.cornerRadius = 5
        }
        else{
            cell.cellVw.backgroundColor = .clear
            cell.cellVw.layer.cornerRadius = 5
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedSortIndex = indexPath.item
        switch indexPath.row{
        case 0:
            books?.sort { $0.bookTitle < $1.bookTitle }
        case 1:
            books?.sort {
                if let rating1 = Float($0.bookRating ?? ""), let rating2 = Float($1.bookRating ?? "") {
                    return rating1 < rating2
                }
                else{
                    return false
                }
            }
        case 2:
            books?.sort {
                if let hits1 = Int($0.bookHits ?? ""), let hits2 = Int($1.bookHits ?? "") {
                    return hits1 < hits2
                }
                else{
                    return false
                }
            }
            
        default:
            print("")
        }
        
    }
    
}

// MARK: TABLEVIEW_DELEGATE_DATASOURCES

extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = booksTblVw.dequeueReusableCell(withIdentifier: "BooksTblCell", for: indexPath) as! BooksTblCell
        cell.book = books?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("indexpath.row = \(indexPath.row) && page = \(((homeVM!.page*10)+9))")
        if indexPath.row == ((homeVM!.page*10)+9){
            homeVM?.FetchAllBooks(searchBook: searchTxtFld.text ?? "", offset: homeVM!.page+1)
        }
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

               let action =  UIContextualAction(style: .normal, title: "Bookmark", handler: { (action,view,completionHandler ) in
                   if self.homeVM!.CheckIsBookmarked(book: self.books![indexPath.row]){
                       self.homeVM?.deleteBookmark(title: self.books![indexPath.row].bookTitle)
                   }
                   else{
                       self.homeVM?.CreateBookmark(book: self.books![indexPath.row])
                   }
                   completionHandler(true)
               })
        if self.homeVM!.CheckIsBookmarked(book: self.books![indexPath.row]){
            action.image = UIImage(systemName: "bookmark.fill")
        }
        else{
            action.image = UIImage(systemName: "bookmark")
        }
           
           let configuration = UISwipeActionsConfiguration(actions: [action])

           return configuration
       }
    
}


// MARK: ALLBOOKS_DELEGATE
extension HomeVC : AllBooksDelegate{
    func allBooks(books: [BookModel]) {
        self.books = books
    }
}

// MARK: TEXTFIELD_DELEGATE
extension HomeVC : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        searchBookWorkItem?.cancel()
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        if updatedText.count > 2{
            searchBookWorkItem = DispatchWorkItem(block: { [weak self] in
                self?.homeVM?.FetchAllBooks(searchBook: updatedText, offset: 0)
            })
            DispatchQueue.main.asyncAfter(deadline: .now()+1.1, execute: searchBookWorkItem!)
        }
        else{
            homeVM?.page = -1
            homeVM?.books = []
            books = []
        }
        return true
    }
    
}
