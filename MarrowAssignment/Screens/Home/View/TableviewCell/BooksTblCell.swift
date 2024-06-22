//
//  BooksTblCell.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 20/06/24.
//

import UIKit
import SDWebImage

class BooksTblCell: UITableViewCell {
    
    // MARK: OUTLETS
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var hitsLbl: UILabel!
    @IBOutlet weak var cellInnerVw: UIView!
    @IBOutlet weak var bookCoverImgVw: UIImageView!
    
    // MARK: VARIABLES
    var book : BookModel?{
        didSet{
            SetupUI()
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      //  SetupUI()
    }
    
    
    // MARK: SETUP_UI_METHOD
    func SetupUI(){
        guard let finalBook = book else{return}
        titleLbl.text = finalBook.bookTitle
        authorLbl.text = finalBook.bookAuthor
        ratingLbl.text = finalBook.bookRating
        hitsLbl.text = finalBook.bookHits
        if let img = book?.bookImage{
            bookCoverImgVw.sd_setImage(with: URL(string: (APIS.bookImageStartUrl +  img + APIS.bookImageEndUrl)), placeholderImage: UIImage(named: "marrow"))
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
