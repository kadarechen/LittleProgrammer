//
//  AdviceViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/31.
//

import UIKit

class AdviceViewController: UIViewController {
    @IBOutlet weak var advice: UIView!
    @IBOutlet weak var keepintouch: UIView!
    @IBOutlet weak var send: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        advice.layer.cornerRadius = 20.0
//        advice.layer.borderColor = UIColor.systemGray5.cgColor
//        advice.layer.borderWidth = 1.0
        keepintouch.layer.cornerRadius = 20.0
        send.layer.cornerRadius = 20.0

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
