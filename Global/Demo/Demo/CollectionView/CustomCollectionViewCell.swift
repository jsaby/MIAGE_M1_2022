//
//  CustomCollectionViewCell.swift
//  Demo
//
//  Created by Julie Saby on 12/11/2020.
//  Copyright © 2020 Julie Saby. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var containerViewColored: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        
		containerViewColored.layer.cornerRadius = 10
    }

	func configure(_ index: Int) {
		containerViewColored.backgroundColor = index % 2 == 0 ? UIColor.red : UIColor.orange
		titleLabel.text = String(index)
	}
}
