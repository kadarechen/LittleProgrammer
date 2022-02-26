//
//  ConfirmViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/4/2.
//

import UIKit

class ConfirmViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var AttentionView: UIView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("是的，和teacD Table匹配")
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(tableView)
        print("进入")
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellID")
            let tempframe = cell.frame
            let tempcg = CGRect(x: tempframe.minX, y: tempframe.minY, width: tempframe.width, height: 100)
            cell.frame = tempcg
    //            print(cell.frame)
        cell.textLabel?.text = teachers[indexPath.row].school + "   " +  teachers[indexPath.row].name
        cell.detailTextLabel?.text = teachers[indexPath.row].gender + "   " +  teachers[indexPath.row].old + "   " +  teachers[indexPath.row].major + "   " +  teachers[indexPath.row].degree
        cell.imageView?.image = UIImage(imageLiteralResourceName: teachers[indexPath.row].image)
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        //set price
        cell.accessoryType = UITableViewCell.AccessoryType.none
        let accessoryViewFrame = CGRect(
            x: 0,
            y: 0,
            width: 80,
            height: teaProCell.rowHeight)
            
    //            teaProCell.rowHeight
            
            
            
        cell.accessoryView = UIView(frame: accessoryViewFrame)
        let princeLabel = UILabel(frame: accessoryViewFrame)
        princeLabel.text = "¥" + teachers[indexPath.row].price + "/时"
        princeLabel.textColor = UIColor.red
        princeLabel.font = UIFont.systemFont(ofSize: 18)
        princeLabel.textAlignment = NSTextAlignment.right
        //        cell.accessoryView?.frame = accessoryViewFrame
        cell.accessoryView?.addSubview(princeLabel)
        cell.selectionStyle = .none
        
        //set detail
        
        return cell
    }
    
    
    
    var teaProCell:UITableView!
    lazy var teachers:[stuteacher] = {
        var teachers = [stuteacher(image: "teaPro_01.JPG", school: "上海交大", name: "Wisk老师", gender: "男", old: "20岁", major: "计算机科学", degree: "研究生", teaOld: "37", price: "100"),stuteacher(image: "teaPro_02.JPG", school: "上海交大", name: "Wisk老师", gender: "女", old: "20岁", major: "计算机科学", degree: "研究生", teaOld: "37", price: "100"),stuteacher(image: "teaPro_03.JPG", school: "上海交大", name: "Wisk老师", gender: "女", old: "20岁", major: "计算机科学", degree: "研究生", teaOld: "37", price: "100")]
        teachers[0].selfIntro = [("自我介绍","你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"),("教学案例","你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"),("获奖和项目经历","你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！")]
        return teachers
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let thisUITableViewFrame = CGRect(
            x: 0,
            y: 70,
            width: 414,
            height: 100)
        teaProCell = UITableView(frame: thisUITableViewFrame, style: .grouped)
        print("***********************************")
        print(view.bounds)
        teaProCell.backgroundColor = UIColor.systemGray6;
        view.addSubview(teaProCell)
        teaProCell.dataSource = self
        teaProCell.delegate = self
        teaProCell.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        teaProCell.rowHeight = 100
        teaProCell.sectionFooterHeight = 0
        teaProCell.sectionHeaderHeight = 0
        teaProCell.separatorStyle = .none
        
        
        
        AttentionView.layer.cornerRadius = 20.0
    }
    

    @IBAction func Pay(_ sender: UIButton) {
//        let  Orders = Order()
    }
    
}

extension ConfirmViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("点击\(indexPath[1])")
        
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0.01
    }
}
