//
//  TeacherDetailCell.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/29.
//

import UIKit

class TeacherDetailCell: UITableViewCell {
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentlabelview: UIView!
    var intro: stuteacher!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentLabel.sizeToFit()
//        contentLabel.layer.cornerRadius = 20.0
//        contentLabel.layer.mask = self.configRectCorner(view: contentLabel, corner: [.topLeft,.topRight, .bottomRight,.bottomLeft], radii: CGSize(width: 15, height: 15))
        
        contentlabelview.layer.cornerRadius = 25.0
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setIntro(introData: Intro) {
        titleLabel.text = introData.title
        contentLabel.text = introData.content
        
    }
    
    
    
    
    
    
    //暴力给控件添加圆角的函数

    func configRectCorner(view: UIView, corner: UIRectCorner, radii: CGSize) -> CALayer {
           
           let maskPath = UIBezierPath.init(roundedRect: view.bounds, byRoundingCorners: corner, cornerRadii: radii)
           
           let maskLayer = CAShapeLayer.init()
           maskLayer.frame = view.bounds
           maskLayer.path = maskPath.cgPath
           
           return maskLayer
       }
}
