//
//  ArticleCell.swift
//  Networking_Jamal_Jones
//
//  Created by Consultant on 12/20/22.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    
    @IBOutlet weak var articleSource: UILabel!
    
    @IBOutlet weak var articleTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.articleTitle.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
