//
//  ItemTableViewCell.swift
//  Lists
//
//  Created by Brandon Fong on 7/18/19.
//  Copyright © 2019 Fiesta Togo Inc. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemTextField: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    var item: ListItem!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkButtonTapped(_ sender: Any) {
        item.checked = !item.checked
        checkButton.setImage(item.checked ? UIImage(named: "Checked") : UIImage(named: "Unchecked"), for: .normal)
        saveLists()
    }
    

    
}
