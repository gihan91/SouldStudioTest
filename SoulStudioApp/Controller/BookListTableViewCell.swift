//
//  BookListTableViewCell.swift
//  SoulStudioApp
//
//  Created by mac on 28/12/21.
//

import UIKit
import Kingfisher

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
    
    func downloadImage(`with` urlString : String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url)

        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                DispatchQueue.main.async {
                    self.imgBook.image = value.image
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
}
