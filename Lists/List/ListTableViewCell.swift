//
//  ListTableViewCell.swift
//  Lists
//
//  Created by Brandon Fong on 7/18/19.
//  Copyright © 2019 Fiesta Togo Inc. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var listNameTextField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
