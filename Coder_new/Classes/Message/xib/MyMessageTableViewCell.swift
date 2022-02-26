//
//  MyMessageTableViewCell.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/30.
//

import UIKit

class MyMessageTableViewCell: UITableViewCell {
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var backgroundImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profile.layer.cornerRadius = 38.00
        contentLabel.sizeToFit()
        let newframe = CGRect(x: contentLabel.frame.minX - 10, y: contentLabel.frame.minY - 10, width: contentLabel.frame.width + 35, height: contentLabel.frame.height + 20)
        print(contentLabel.frame)
        print(newframe)
        backgroundImg.frame = newframe
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
