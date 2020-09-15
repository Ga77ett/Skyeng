//
//  SKYResultCell.swift
//  Skyeng
//
//  Created by Kirill Shalankin on 15.09.2020.
//  Copyright © 2020 Kirill Shalankin. All rights reserved.
//

import UIKit

class SKYResultCell: SKYTableViewCell {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    
    
    override class func cellHeight() -> CGFloat {
        return 56
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(word: String, meaningText: String) {
        wordLabel.text = word
        meaningLabel.text = meaningText
    }

}
