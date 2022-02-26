//
//  ProfileViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/29.
//

import UIKit
import Social

class ProfileViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var userInfoView: UIView!
    @IBOutlet weak var becomeTeaView: UIView!
    @IBOutlet weak var scrollTable: UIScrollView!
    
    
    var currentClickPath:IndexPath = []

    
    lazy var settingArray:[(setimg:String,settitle:String)] = {
        var settingArray = [("set1","软件设置"),("set2","帮助中心"),("set3","意见反馈"),("set4","分享 Coder小小程序猿"),("set5","关于 Coder小小程序猿")]
        return settingArray
    }()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell = UITableViewCell.init(style: .default, reuseIdentifier: "cellID")
        cell.textLabel?.text = settingArray[indexPath.row].settitle
        cell.imageView?.image = UIImage(imageLiteralResourceName: settingArray[indexPath.row].setimg)
//        cell.imageView?.frame
//        let imageframe = CGRect(x: (cell.imageView?.frame.minX)!, y: (cell.imageView?.frame.minY)!, width: (cell.imageView?.frame.width)!, height: 10)
//        cell.imageView?.frame = imageframe
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        if indexPath.row + 1 != self.tableView(AllMessage, numberOfRowsInSection: 1){
            print("找到cell：\(self.tableView(AllMessage, numberOfRowsInSection: 1))")
            let tempframe = CGRect(x: 0,y: AllMessage.rowHeight-1,width: AllMessage.frame.width,height: 1)
            print("tempframe:")
            print(tempframe)
            let lineView = UIView(frame: tempframe)
            lineView.backgroundColor = UIColor.systemGray5
            cell.addSubview(lineView)
            
        }
//        if indexPath.row + 1 == 1{
//            print("找到第一个cell：\(self.tableView(AllMessage, numberOfRowsInSection: 1))")
//            let tempframe = CGRect(x: 0,y: 0,width: AllMessage.frame.width,height: 2)
//            print("tempframe:")
//            print(tempframe)
//            let lineView = UIView(frame: tempframe)
//            lineView.backgroundColor = UIColor.red
//            cell.addSubview(lineView)
//
//        }
        
        return cell
    }
    
    var AllMessage:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userInfoView.layer.cornerRadius = 25.0
        userInfoView.clipsToBounds = true
        becomeTeaView.layer.cornerRadius = 25.0
        
        
        let thisUITableViewFrame = CGRect(
            x: 19,
            y: 365,
            width: 376,
            height: 250)
        AllMessage = UITableView(frame: thisUITableViewFrame, style: .grouped)
        print("***********************************")
        print(view.bounds)
//        AllMessage.frame.y = 50    y:readonly
//        AllMessage.backgroundColor = UIColor.systemGray6;
        scrollTable.addSubview(AllMessage)
        AllMessage.dataSource = self
        AllMessage.delegate = self
        AllMessage.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        AllMessage.rowHeight = 50
//        AllMessage.sectionFooterHeight = 30
        AllMessage.sectionHeaderHeight = 0
        AllMessage.isScrollEnabled = false
        AllMessage.separatorStyle = .none
        AllMessage.layer.cornerRadius = 25.0
        
        let imgClick = UITapGestureRecognizer()
//        let imgClick = UITapGestureRecognizer(target: self, action: "imAction")
        becomeTeaView.addGestureRecognizer(imgClick)
                //开启 isUserInteractionEnabled 手势否则点击事件会没有反应
        becomeTeaView.isUserInteractionEnabled = true
        imgClick.addTarget(self, action: #selector(showBecomeTeacherPage(sender:)))
        
        let profileClick = UITapGestureRecognizer()
//        let imgClick = UITapGestureRecognizer(target: self, action: "imAction")
        userInfoView.addGestureRecognizer(profileClick)
                //开启 isUserInteractionEnabled 手势否则点击事件会没有反应
        userInfoView.isUserInteractionEnabled = true
        profileClick.addTarget(self, action: #selector(showProfileModify(sender:)))
        

//        @objc self.automaticallyAdjustsScrollViewInsets = NO
       
    }
    
    @objc func showProfileModify(sender:UITapGestureRecognizer) {
        print("点击 modifyProfile")
        UIView.animate(withDuration: 0.2) { [self] in
            userInfoView.backgroundColor = UIColor.systemGray4
        }
        delay(by: 0.5) {
            print("0.5秒后执行")
            UIView.animate(withDuration: 0.3) {[self] in
                userInfoView.backgroundColor = UIColor.systemBackground
            }
        }
        let sb = UIStoryboard(name: "ModifyProfile", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "ModifyProfile") as! ModifyProfileViewController
        self.navigationController?.present(vc, animated: true)
    }
    @objc func showBecomeTeacherPage(sender:UITapGestureRecognizer) {
        print("点击图片")
        let sb = UIStoryboard(name: "Join", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "Join") as! JoinViewController
        self.navigationController?.present(vc, animated: true)
    }
}





func imAction() -> Void {
        print("图片点击事件")
}


extension ProfileViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("点击\(indexPath[1])")
        currentClickPath = indexPath
        switch indexPath.row {
        case 0:
            let sb = UIStoryboard(name: "Setting", bundle:nil)
            let vc = sb.instantiateViewController(withIdentifier: "Setting") as! SettingViewController
            self.navigationController?.present(vc, animated: true)
        case 1:
            let sb = UIStoryboard(name: "Help", bundle:nil)
            let vc = sb.instantiateViewController(withIdentifier: "Help") as! HelpViewController
            self.navigationController?.present(vc, animated: true)
        case 2:
            let sb = UIStoryboard(name: "Advice", bundle:nil)
            let vc = sb.instantiateViewController(withIdentifier: "Advice") as! AdviceViewController
            self.navigationController?.present(vc, animated: true)
        case 3:
            share()
        case 4:
            let sb = UIStoryboard(name: "About", bundle:nil)
            let vc = sb.instantiateViewController(withIdentifier: "About") as! AboutViewController
            self.navigationController?.present(vc, animated: true)
            
        default:
            break
        }
    
        
    }
    @objc func share(){
            DispatchQueue.main.async {
                let myWebsite = NSURL(string:"http://coder.com/")
                let img: UIImage = #imageLiteral(resourceName: "CoderPro")
                guard let url = myWebsite else {
                    print("nothing found")
                    return
                }
                
                let shareItems:Array = [img, url]
                let activityController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
                activityController.modalPresentationStyle = .fullScreen
                activityController.completionWithItemsHandler = {
                    (type, flag, array, error) -> Void in
                    if flag == true {
    //                    分享成功
                    } else {
    //                    分享失败
                    }
                }
                self.present(activityController, animated: true, completion: nil)
            }
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
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0.01
    }
}
