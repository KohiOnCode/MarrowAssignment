//
//  BookmarkVC.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 20/06/24.
//

import UIKit

class BookmarkVC: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak var booksTblVw: UITableView!
    
    // MARK: VARIABLES
    var books : [BookModel]?{
        didSet{
            DispatchQueue.main.async {
                self.booksTblVw.reloadData()
            }
        }
    }
    
    var bookmarkVM : BookmarkViewModel?
    
    
    // MARK: VIEW_DID_LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        bookmarkVM = BookmarkViewModel()
        BooksTblCell.registerTableCell(for: booksTblVw)
        booksTblVw.separatorStyle = .none
    }
    
    // MARK: VIEW_WILL_APPEAR
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        books = bookmarkVM?.getAllBookmarks() ?? []
    }
    
    // MARK: CUSTOM_BACK_BUTTON_ACTION
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}

