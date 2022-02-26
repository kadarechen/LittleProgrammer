//
//  SentLocationViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/4/11.
//

import UIKit

class SentLocationViewController: UIViewController {
    @IBOutlet weak var locationBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.shareManager.creatLocationManager().startLocation { (location, adress, error) in
                    print("经度 \(location?.coordinate.longitude ?? 0.0)")
                    print("纬度 \(location?.coordinate.latitude ?? 0.0)")
                    print("地址\(adress ?? "无法获取位置信息")")
                    print("error\(error ?? "没有错误")")
            self.locationBtn.setTitle(adress ?? "     无法获取当前位置信息", for: UIControl.State.normal)
            self.locationBtn.backgroundColor = UIColor.systemBlue
                }

        locationBtn.layer.cornerRadius = 18.0
        
    }
    

}
