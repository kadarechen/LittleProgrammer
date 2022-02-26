//
//  HelpViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/31.
//

import UIKit

class HelpViewController: UIViewController {
    @IBOutlet weak var consult: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        consult.layer.cornerRadius = 20.0
        consult.layer.borderColor = UIColor.systemGray5.cgColor
        consult.layer.borderWidth = 1.0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func consult(_ sender: UIButton) {
        print("click consult")
        var controller:UIAlertController?
        controller = UIAlertController(title: "确定要拨打电话吗？", message: "您可能需要支付一定的通话费用。 客服在线时间：9:00 - 18:00",preferredStyle: .actionSheet)
        let phone = UIAlertAction(title: "拨打电话：021-6765-2311",style:UIAlertAction.Style.default,handler:{(paramAction:UIAlertAction!) in})
        let cancel = UIAlertAction(title: "取消",style:UIAlertAction.Style.cancel,handler:{(paramAction:UIAlertAction!) in})
        controller!.addAction(phone)
        controller!.addAction(cancel)
        self.present(controller!, animated: true, completion: nil)

//        UIAlertActionStyleCancel
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
