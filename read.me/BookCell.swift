//
//  BookCell.swift
//  read.me
//
//  Created by Jasmine Ben-Whyte on 26/4/24.
//

import UIKit

class BookCell: UITableViewCell {

    @IBOutlet weak var posterPathImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
