//
//  ViewController1.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
//import PagingMenuController

class ViewController1: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
//    var AllMessage:UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellID")
    //        cell.textLabel?.text="\(indexPath.row)"
            cell.textLabel?.text = "四川大学 Watkin老师"
    // 太长了，长度超出限制
    //        cell.detailTextLabel?.text = teachers[indexPath.row].gender + "   " +  teachers[indexPath.row].old + "   " +  teachers[indexPath.row].major + "   " +  teachers[indexPath.row].degree + "   " + "已授" + teachers[indexPath.row].teaOld + "课"
            cell.detailTextLabel?.text = "消息：家长您好😄，我大概周二有空，可以来看看，如果小万同学可以的基础足够应付"
            cell.imageView?.image = UIImage(imageLiteralResourceName: "teaPro_02")
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
        }else{
            var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellID")
    //        cell.textLabel?.text="\(indexPath.row)"
            cell.textLabel?.text = "四川农业大学 许老师"
    // 太长了，长度超出限制
    //        cell.detailTextLabel?.text = teachers[indexPath.row].gender + "   " +  teachers[indexPath.row].old + "   " +  teachers[indexPath.row].major + "   " +  teachers[indexPath.row].degree + "   " + "已授" + teachers[indexPath.row].teaOld + "课"
            cell.detailTextLabel?.text = "消息：请问现在小万同学的学习进度如何"
            cell.imageView?.image = UIImage(imageLiteralResourceName: "teaPro_01")
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
            princeLabel.text = "下午14:56"
            princeLabel.textColor = UIColor.systemGray
            princeLabel.font = UIFont.systemFont(ofSize: 15)
            princeLabel.textAlignment = NSTextAlignment.right
//            princeLabel.textAlignment = .natural
            //        cell.accessoryView?.frame = accessoryViewFrame
            cell.accessoryView?.addSubview(princeLabel)
            
            //set detail
            
            return cell
        }
    }
    
    var AllMessage:UITableView!
    var currentClickPath:IndexPath = []


    
    
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


extension ViewController1{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("点击\(indexPath[1])")
        
        
        currentClickPath = indexPath
        let sb = UIStoryboard(name: "Dialogue", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "Dialogue") as! DialogueViewController
        self.navigationController?.present(vc, animated: true)
    }
    
    
    
    
    
    @IBAction func unwindSegue(sender: UIStoryboardSegue)
    {
        print("ender unwind")
        delay(by: 0.3) {
            print("3秒后执行")
            self.AllMessage.deselectRow(at: self.currentClickPath, animated: true)
        }
//        AllTeacher.deselectRow(at: currentClickPath, animated: true)
        print("aaa")
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
