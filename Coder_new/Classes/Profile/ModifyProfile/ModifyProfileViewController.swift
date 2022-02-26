//
//  ModifyProfileViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/4/14.
//

import UIKit

class ModifyProfileViewController: UIViewController {
    @IBOutlet weak var mytextField1: UIView!
    @IBOutlet weak var mytextField2: UIView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var mytextField3: UIView!
    @IBOutlet weak var mytextField4: UIView!
    @IBOutlet weak var mytextField5: UIView!
    @IBOutlet weak var btn2: UIButton!
//    @IBOutlet weak var btn3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mytextField1.layer.cornerRadius = 20.0
        mytextField2.layer.cornerRadius = 20.0
        btn1.layer.cornerRadius = 23.0
        mytextField3.layer.cornerRadius = 20.0
        mytextField4.layer.cornerRadius = 20.0
        mytextField5.layer.cornerRadius = 20.0
        btn2.layer.cornerRadius = 23.0
//        btn3.layer.cornerRadius = 28

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
