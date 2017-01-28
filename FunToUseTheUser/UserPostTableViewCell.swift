//
//  UserPostTableViewCell.swift
//  FunToUseTheUser
//
//  Created by Harold Davis on 1/28/17.
//  Copyright © 2017 Harold Davis. All rights reserved.
//

import UIKit

class UserPostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var postTitle: UILabel!
    
    @IBOutlet weak var postBody: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
