//
//  DataTableViewCell.swift
//  Demo
//
//  Created by Julie Saby on 09/03/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
		
		titleLabel.textColor = UIColor.blue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
