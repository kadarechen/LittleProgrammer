//
//  FinishedOrderTableViewCell.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/28.
//

import UIKit

class FinishedOrderTableViewCell: UITableViewCell {
    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var teaPro: UIImageView!
    @IBOutlet weak var teaTitle: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
//    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    var importTea: stuteacher!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        btn1.layer.cornerRadius = 8.0;//圆角的弧度
        btn1.layer.borderColor = UIColor.systemGray2.cgColor;//设置边框颜色
        btn1.layer.borderWidth = 1.0;//设置边框宽度
        btn2.layer.cornerRadius = 8.0;//圆角的弧度
        btn2.layer.borderColor = UIColor.systemGray2.cgColor;//设置边框颜色
        btn2.layer.borderWidth = 1.0;//设置边框宽度
//        btn3.layer.cornerRadius = 8.0;//圆角的弧度
//        btn3.layer.borderColor = UIColor.systemOrange.cgColor;//设置边框颜色
//        btn3.layer.borderWidth = 1.0;//设置边框宽度
        btn4.layer.cornerRadius = 8.0;//圆角的弧度
        btn4.layer.borderColor = UIColor.systemOrange.cgColor;//设置边框颜色
        btn4.layer.borderWidth = 1.0;//设置边框宽度
        cornerView.layer.cornerRadius = 20.0;
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }
    func set(importTea: stuteacher) {
        teaPro.image = UIImage(imageLiteralResourceName: importTea.image)
        teaTitle.text = importTea.school + " " + importTea.name
    }
    
    @IBAction func btn1action(_ sender: UIButton) {
        let theViewControllerYouSee = currentViewController()
        (theViewControllerYouSee as! OrderViewControoler).showMessage()
    }
    @IBAction func btn2action(_ sender: UIButton) {
        let theViewControllerYouSee = currentViewController()
        (theViewControllerYouSee as! OrderViewControoler).showPhone()
    }
    
    @IBAction func btn4action(_ sender: UIButton) {
        let theViewControllerYouSee = currentViewController()
        (theViewControllerYouSee as! OrderViewControoler).showOrderDetail()
    }
}
