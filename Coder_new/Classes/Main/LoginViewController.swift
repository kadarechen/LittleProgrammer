//
//  LoginViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/4/14.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var getCodeBtn: UIButton!
    @IBOutlet weak var getCodeBtnView1: UIView!
    @IBOutlet weak var getCodeBtnView2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        view1.layer.cornerRadius = 27
        view2.layer.cornerRadius = 27
        view3.layer.cornerRadius = 27
        btn.layer.cornerRadius = 27
        // Do any additional setup after loading the view.
    }
//    override func viewWillDisappear(_ animated:Bool) {
//
//            super.viewWillDisappear(animated)
//
//            navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
//
//
//
//        }
//    override func viewDidAppear(_ animated:Bool) {
//
//            navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
//
//
//
//        }



    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func getCode(_ sender: UIButton) {
//        for i in (1...60){
//            let j = 60 - i + 1
//            delay(by: 1) {
//                print("1秒后执行")
////                UIView.animate(withDuration: 0.2) {
////
////                }
//                sender.setTitle(String(i), for: .normal)
//            }
//        }
        getCodeBtn.isUserInteractionEnabled = false
        getCodeBtnView1.backgroundColor = UIColor.systemGray
        getCodeBtnView2.backgroundColor = UIColor.systemGray
        var mytime = 60
        dispatchTimer(timeInterval: 1, repeatCount: 60){ [self]_,_ in
                mytime -= 1
            let newstring = "\(mytime)s后重新获取"
            getCodeBtn.titleLabel!.text = newstring
            sender.setTitle(newstring, for: .normal)
        }
        delay(by: 60){ [self] in
            sender.setTitle("获取验证码", for: .normal)
            getCodeBtn.isUserInteractionEnabled = true
            getCodeBtnView1.backgroundColor = UIColor.systemBlue
            getCodeBtnView2.backgroundColor = UIColor.systemBlue
        }
    }
    @IBAction func loginIn(_ sender: UIButton) {
        isLogin = true
    }
}
