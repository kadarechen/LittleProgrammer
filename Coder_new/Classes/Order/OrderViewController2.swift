//
//  OrderViewController2.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/28.
//

import UIKit
import PagingMenuController
//import R

//class OrderViewController2: UIViewController {
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


//class OrderViewController2: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}

class OrderViewController2: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    lazy var teachers:[stuteacher] = {
        var teachers = [stuteacher(image: "teaPro_01.JPG", school: "上海交大", name: "Wisk老师", gender: "男", old: "20岁", major: "计算机科学", degree: "研究生", teaOld: "37", price: "100"),stuteacher(image: "teaPro_02.JPG", school: "上海交大", name: "Wisk老师", gender: "女", old: "20岁", major: "计算机科学", degree: "研究生", teaOld: "37", price: "100"),stuteacher(image: "teaPro_03.JPG", school: "上海交大", name: "Wisk老师", gender: "女", old: "20岁", major: "计算机科学", degree: "研究生", teaOld: "37", price: "100")]
        return teachers
    }()
    
//    var AllOrder:UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
//            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellID")
//    //        cell.textLabel?.text="\(indexPath.row)"
//            cell.textLabel?.text = "四川大学 Watkin老师"
//    // 太长了，长度超出限制
//    //        cell.detailTextLabel?.text = teachers[indexPath.row].gender + "   " +  teachers[indexPath.row].old + "   " +  teachers[indexPath.row].major + "   " +  teachers[indexPath.row].degree + "   " + "已授" + teachers[indexPath.row].teaOld + "课"
//            cell.detailTextLabel?.text = "消息：家长您好😄，我大概周二有空，可以来看看，如果小万同学可以的基础足够应付"
//            cell.imageView?.image = UIImage(imageLiteralResourceName: "teaPro_02")
////            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
//
//            //set price
//            cell.accessoryType = UITableViewCell.AccessoryType.none
//            let accessoryViewFrame = CGRect(
//                x: 0,
//                y: 0,
//                width: 80,
//                height: AllOrder.rowHeight)
//            cell.accessoryView = UIView(frame: accessoryViewFrame)
//            let princeLabel = UILabel(frame: accessoryViewFrame)
//            princeLabel.text = "上午10:25"
//            princeLabel.textColor = UIColor.systemGray
//            princeLabel.font = UIFont.systemFont(ofSize: 15)
//            princeLabel.textAlignment = NSTextAlignment.right
////            princeLabel.textAlignment = .natural
//            //        cell.accessoryView?.frame = accessoryViewFrame
//            cell.accessoryView?.addSubview(princeLabel)
//
//            //set detail
        let cell:FinishedOrderTableViewCell = Bundle.main.loadNibNamed("FinishedOrderTableViewCell", owner:nil,  options:nil)?.first as! FinishedOrderTableViewCell
        cell.set(importTea: teachers[indexPath.row])
        
        return cell
    }
    
    var AllOrder:UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        
//        let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
//        textLabel.center = view.center
//        textLabel.textAlignment = .center
//        textLabel.font = UIFont.systemFont(ofSize: 24)
//        textLabel.text = "View Controller 1"
//        view.addSubview(textLabel)
        
        AllOrder = UITableView(frame: view.bounds, style: .grouped)
        print("***********************************")
        print(view.bounds)
//        AllOrder.frame.y = 50    y:readonly
        AllOrder.backgroundColor = UIColor.systemGray6;
        view.addSubview(AllOrder)
        AllOrder.dataSource = self
        AllOrder.delegate = self
        AllOrder.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        AllOrder.rowHeight = 180
        AllOrder.sectionFooterHeight = 30
        AllOrder.sectionHeaderHeight = 0
        AllOrder.separatorStyle = .none
//        @objc self.automaticallyAdjustsScrollViewInsets = NO
        
    }
}


extension OrderViewController2{
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

