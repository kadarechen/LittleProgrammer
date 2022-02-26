//
//  ViewController2.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
//import PagingMenuController

//class ViewController2: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = UIColor.lightGray
//
//        let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
//        textLabel.center = view.center
//        textLabel.textAlignment = .center
//        textLabel.font = UIFont.systemFont(ofSize: 24)
//        textLabel.text = "View Controller 2"
//        view.addSubview(textLabel)
//    }
//}

class ViewController2: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
//    var AllMessage:UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellID")
    //        cell.textLabel?.text="\(indexPath.row)"
            cell.textLabel?.text = "Coder 会员活动"
    // 太长了，长度超出限制
    //        cell.detailTextLabel?.text = teachers[indexPath.row].gender + "   " +  teachers[indexPath.row].old + "   " +  teachers[indexPath.row].major + "   " +  teachers[indexPath.row].degree + "   " + "已授" + teachers[indexPath.row].teaOld + "课"
            cell.detailTextLabel?.text = "🎁🎉一年会员资格限时0元抢，分享活动给好友，立得一箱雪碧"
            cell.imageView?.image = UIImage(imageLiteralResourceName: "CoderPro")
//            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            
            //set price
            cell.accessoryType = UITableViewCell.AccessoryType.none
            let accessoryViewFrame = CGRect(
                x: 0,
                y: 0,
                width: 80,
                height: AllMessage.rowHeight)
            cell.accessoryView = UIView(frame: accessoryViewFrame)
            let princeLabel = UILabel(frame: accessoryViewFrame)
            princeLabel.text = "上午10:25"
            princeLabel.textColor = UIColor.systemGray
            princeLabel.font = UIFont.systemFont(ofSize: 15)
            princeLabel.textAlignment = NSTextAlignment.right
//            princeLabel.textAlignment = .natural
            //        cell.accessoryView?.frame = accessoryViewFrame
            cell.accessoryView?.addSubview(princeLabel)
            
            //set detail
            
            return cell
    }
    
    var AllMessage:UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        
//        let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
//        textLabel.center = view.center
//        textLabel.textAlignment = .center
//        textLabel.font = UIFont.systemFont(ofSize: 24)
//        textLabel.text = "View Controller 1"
//        view.addSubview(textLabel)
        
        AllMessage = UITableView(frame: view.bounds, style: .grouped)
        print("***********************************")
        print(view.bounds)
//        AllMessage.frame.y = 50    y:readonly
        AllMessage.backgroundColor = UIColor.systemGray6;
        view.addSubview(AllMessage)
        AllMessage.dataSource = self
        AllMessage.delegate = self
        AllMessage.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        AllMessage.rowHeight = 100
        AllMessage.sectionFooterHeight = 30
        AllMessage.sectionHeaderHeight = 0
//        @objc self.automaticallyAdjustsScrollViewInsets = NO
        
    }
}


extension ViewController2{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("点击\(indexPath[1])")
    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        //创建一个ContactAdd类型的按钮
//        let button:UIButton = UIButton(type:.system)
//        //设置按钮位置和大小
////        button.frame = CGRect(x:10, y:150, width:100, height:30)
//        //设置按钮文字
//        button.setTitle("加载更多", for:.normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
////        self.view.addSubview(button)
//        return button
//    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0.01
    }
}

