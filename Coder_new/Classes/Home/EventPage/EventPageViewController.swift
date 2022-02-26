//
//  EventPageViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/4/14.
//

import UIKit

class EventPageViewController: UIViewController {

    @IBOutlet weak var currentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if currenrEvent == 100 {
            currentLabel.text = "来源: 活动入口模块"
        }else{
            currentLabel.text = "来源: banner_" + String(currenrEvent)
        }
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
