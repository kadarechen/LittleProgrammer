//
//  AboutViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/4/1.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var AboutScrollView: UIScrollView!
    @IBOutlet weak var AboutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var newframe = AboutLabel.frame
//        newframe = CGRect(x: newframe.minX, y: newframe.minY, width: newframe.width, height: 1100)
//        AboutLabel.frame = newframe
        AboutLabel.sizeToFit()
        AboutScrollView.contentSize = CGSize(width: AboutScrollView.contentSize.width,height: AboutLabel.frame.height + AboutLabel.frame.minY)
    }
    

}
