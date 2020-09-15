//
//  SKYTableViewCell.swift
//  Skyeng
//
//  Created by Kirill Shalankin on 15.09.2020.
//  Copyright © 2020 Kirill Shalankin. All rights reserved.
//

import UIKit

class SKYTableViewCell: UITableViewCell {
    
    class func cellHeight() -> CGFloat {
        return 0
    }
    
    class func cellNibName() -> String {
        return cellIdentifier()
    }
    
    class func cellIdentifier() -> String {
        return String(describing: self)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
