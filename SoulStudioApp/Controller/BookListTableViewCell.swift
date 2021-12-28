//
//  BookListTableViewCell.swift
//  SoulStudioApp
//
//  Created by mac on 28/12/21.
//

import UIKit

class BookListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblBookDescription: UILabel!
    @IBOutlet weak var lblBookTitle: UILabel!
    @IBOutlet weak var imgBook: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
