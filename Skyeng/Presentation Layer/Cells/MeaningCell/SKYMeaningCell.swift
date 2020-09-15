//
//  SKYMeaningCell.swift
//  Skyeng
//
//  Created by Kirill Shalankin on 15.09.2020.
//  Copyright © 2020 Kirill Shalankin. All rights reserved.
//

import UIKit
import SDWebImage

class SKYMeaningCell: SKYTableViewCell {

    @IBOutlet weak var meaningImageView: UIImageView!
    @IBOutlet weak var meaningLabel: UILabel!
    
    
    override class func cellHeight() -> CGFloat {
        return 60
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(urlString: String, text: String) {
        meaningImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        meaningImageView!.sd_setImage(with: URL(string: "http:\(urlString)"), placeholderImage: nil,
                                      options: [.continueInBackground, .highPriority], context: nil)
        meaningLabel.text = text
    }
    
}
