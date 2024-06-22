//
//  BookmarkVC+Extension.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 22/06/24.
//

import Foundation
import UIKit


// MARK: TABLEVIEW_DELEGATE_DATASOURCES
extension BookmarkVC : UITableViewDelegate, UITableViewDataSource{
    
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
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action =  UIContextualAction(style: .normal, title: "Bookmark", handler: { (action,view,completionHandler ) in
            self.bookmarkVM?.deleteBookmark(title: self.books![indexPath.row].bookTitle)
            completionHandler(true)
            self.books = self.bookmarkVM?.getAllBookmarks() ?? []
        })
        action.image = UIImage(systemName: "bookmark.fill")
        let configuration = UISwipeActionsConfiguration(actions: [action])
        
        return configuration
    }
    
}


