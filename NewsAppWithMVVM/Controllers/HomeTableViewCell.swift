//
//  HomeTableViewCell.swift
//  NewsAppWithMVVM
//
//  Created by Cahyanto Setya Budi on 11/19/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitleNews: UILabel!
    @IBOutlet weak var labelAuthorNews: UILabel!
    @IBOutlet weak var labelPostedDateNews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
