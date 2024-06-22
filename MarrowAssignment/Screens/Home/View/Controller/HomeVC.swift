//
//  HomeVC.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 20/06/24.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak var sortCollectionVw : UICollectionView!
    @IBOutlet weak var booksTblVw : UITableView!
    @IBOutlet weak var searchTxtFld: UITextField!
    
    // MARK: VARIABLES
    var homeVM : HomeViewModel?
    let sortCategoryArr = ["Title", "Ratings", "Hint"]
    var searchBookWorkItem : DispatchWorkItem?
    var selectedSortIndex = -1 {
        didSet{
            DispatchQueue.main.async {
                self.sortCollectionVw.reloadData()
            }
        }
    }
    var books : [BookModel]? {
        didSet{
            DispatchQueue.main.async {
                self.booksTblVw.reloadData()
            }
        }
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        SortCVCell.registerCollectionViewCell(for: sortCollectionVw)
        BooksTblCell.registerTableCell(for: booksTblVw)
        booksTblVw.showsVerticalScrollIndicator = false
        homeVM = HomeViewModel()
        homeVM?.delegate = self
        searchTxtFld.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    // MARK: BOOKMARK_SCREEN_BTN_ACTION
    @IBAction func bookmarkBtnAction(_ sender : UIButton){
        self.NavigateToNextVC(storyboard: "Main", viewController: "BookmarkVC")
    }
    
    // MARK: LOGOUT_SCREEN_BTN_ACTION
    @IBAction func logoutBtnAction(_ sender : UIButton){
        LocalStore.shared.isLoggedIn = false
        self.NavigateToNextVC(storyboard: "Login", viewController: "LoginVC")
    }
    

}

