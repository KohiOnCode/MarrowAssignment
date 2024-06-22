//
//  UITableViewCell+Register.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 20/06/24.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    // MARK: REGISTER_TABLEVIEWCELL_EXTENSION
    
    static func registerTableCell(for tableView: UITableView)  {
        let cellName = String(describing: self)
        let cellIdentifier = cellName
        let cellNib = UINib(nibName: String(describing: self), bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
}
