//
//  DialogueViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/30.
//

import UIKit

class DialogueViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    
    @IBOutlet weak var sentView: UIView!
    @IBOutlet weak var sentBtn: UIButton!
    @IBOutlet weak var searchview: UIView!
    @IBOutlet weak var moreView: UIView!
    @IBOutlet weak var comfirmBook: UIButton!
    @IBOutlet weak var sendImg: UIButton!
    @IBOutlet weak var sendLocation: UIButton!
    @IBOutlet weak var bottonHiddenView: UIView!
    
    
    var teacDetailInfo:UITableView!

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("enter new cell number")
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0{
            print("%%%%%%%%0")
            let cell:MyMessageTableViewCell = Bundle.main.loadNibNamed("MyMessageTableViewCell", owner:nil,  options:nil)?.first as! MyMessageTableViewCell
            cell.selectionStyle = .none
            print(cell)
            
            return cell
        }
        else{
            print("%%%%%%%1")
            let cell:YourMessageTableViewCell = Bundle.main.loadNibNamed("YourMessageTableViewCell", owner:nil,  options:nil)?.first as! YourMessageTableViewCell
            cell.selectionStyle = .none
            print(cell)
            
            return cell
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //第二个table
        let thisUITableViewFrame2 = CGRect(
            x: 0,
            y: 70,
            width: 414,
            height: 718-70)
        teacDetailInfo = UITableView(frame: thisUITableViewFrame2, style: .grouped)
        print("***********************************2")
        print(teacDetailInfo.frame)
        teacDetailInfo.backgroundColor = UIColor.systemGray6;
        teacDetailInfo.dataSource = self
        teacDetailInfo.delegate = self
        teacDetailInfo.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
//        teacDetailInfo.rowHeight = 100
        teacDetailInfo.sectionFooterHeight = 0
        teacDetailInfo.sectionHeaderHeight = 0
        teacDetailInfo.separatorStyle = .none
        self.view.addSubview(teacDetailInfo)
//        teacDetailInfo.rowHeight = 200
        //上面这一行暂时放着

        
        
        
        
        searchview.layer.cornerRadius = 10.0
        searchview.layer.borderColor = UIColor.systemGray5.cgColor
        searchview.layer.borderWidth = 1.0
        
        sentBtn.layer.cornerRadius = 10.0;//圆角的弧度
        sentBtn.layer.borderColor = UIColor.systemBlue.cgColor;//设置边框颜色
        sentBtn.layer.borderWidth = 1.0;//设置边框宽度
        
        
        view.bringSubviewToFront(moreView)
        view.bringSubviewToFront(sentView)
        view.bringSubviewToFront(bottonHiddenView)
        
        
        comfirmBook.layoutButtonEdgeInsets(style: .ButtonEdgeInsetsStyleTop, space: 10)
        sendImg.layoutButtonEdgeInsets(style: .ButtonEdgeInsetsStyleTop, space: 10)
        sendLocation.layoutButtonEdgeInsets(style: .ButtonEdgeInsetsStyleTop, space: 10)

        
    
    }

    @IBAction func moreAction(_ sender: UIButton) {
        if moreView.frame.minY == 794{
            //is hidden now, about to show
            UIView.animate(withDuration: 0.2) {
                var newframe = CGRect(x: self.moreView.frame.minX, y: self.moreView.frame.minY - self.moreView.frame.height, width: self.moreView.frame.width, height: self.moreView.frame.height)
                self.moreView.frame = newframe
                newframe = CGRect(x: self.sentView.frame.minX, y: self.sentView.frame.minY - self.moreView.frame.height, width: self.sentView.frame.width, height: self.sentView.frame.height)
                self.sentView.frame = newframe
            }
            delay(by: 0.1) {
                print("3秒后执行")
                UIView.animate(withDuration: 0.3) {
                    self.teacDetailInfo.contentOffset.y += self.moreView.frame.height

                }
            }
        }else{
            //is showing now, about to hidden
            UIView.animate(withDuration: 0.2 ) {
                var newframe = CGRect(x: self.moreView.frame.minX, y: self.moreView.frame.minY + self.moreView.frame.height, width: self.moreView.frame.width, height: self.moreView.frame.height)
                self.moreView.frame = newframe
                newframe = CGRect(x: self.sentView.frame.minX, y: self.sentView.frame.minY + self.moreView.frame.height, width: self.sentView.frame.width, height: self.sentView.frame.height)
                self.sentView.frame = newframe
//                self.teacDetailInfo.contentOffset.y -= self.moreView.frame.height
            }
            delay(by: 0.1) {
                print("3秒后执行")
                UIView.animate(withDuration: 0.3) {
                    self.teacDetailInfo.contentOffset.y -= self.moreView.frame.height

                }
            }


        }
    }
    
    
    @IBAction func ComfirmAction(_ sender: UIButton) {
        print("enter confirm")
//        let sb = UIStoryboard(name: "Confirm", bundle:nil)
//        let vc = sb.instantiateViewController(withIdentifier: "Confirm") as! ConfirmViewController
//        self.navigationController?.push(vc, animated: true)
    }
    
    @IBAction func SendImgAction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                    //初始化图片控制器
                    let picker = UIImagePickerController()
                    //设置代理
                    picker.delegate = self
                    //指定图片控制器类型
                    picker.sourceType = .photoLibrary
                    //弹出控制器，显示界面
                    self.present(picker, animated: true, completion: {
                        () -> Void in
                    })
                }else{
                    print("读取相册错误")
                }
        //https://www.hangge.com/blog/cache/detail_1174.html
    }
    
    
    @IBAction func SendLocationAction(_ sender: UIButton) {
    }
    

    
    @IBAction func unwindSegue(sender: UIStoryboardSegue)
    {
        print("ender unwind")
    }
}





//Relocation img and text in one button
enum ButtonEdgeInsetsStyle {
   case ButtonEdgeInsetsStyleTop // image在上，label在下
   case ButtonEdgeInsetsStyleLeft  // image在左，label在右
   case ButtonEdgeInsetsStyleBottom  // image在下，label在上
   case ButtonEdgeInsetsStyleRight // image在右，label在左
}


//Relocation img and text in one button
extension UIButton {
    func layoutButtonEdgeInsets(style:ButtonEdgeInsetsStyle,space:CGFloat) {
      var labelWidth : CGFloat = 0.0
      var labelHeight : CGFloat = 0.0
        var imageEdgeInset = UIEdgeInsets.zero
        var labelEdgeInset = UIEdgeInsets.zero
      let imageWith = self.imageView?.frame.size.width
      let imageHeight = self.imageView?.frame.size.height
//      if Double(UIDevice.currentDevice().systemVersion) >= 8.0 {
        labelWidth = (self.titleLabel?.intrinsicContentSize.width)!
        labelHeight = (self.titleLabel?.intrinsicContentSize.height)!
//      }else {
//          labelWidth = (self.titleLabel?.frame.size.width)!
//          labelHeight = (self.titleLabel?.frame.size.height)!
//      }
//      labelWidth = CGFloat(36)
      switch style {
      case .ButtonEdgeInsetsStyleTop:
        imageEdgeInset = UIEdgeInsets(top: -labelHeight-space/2.0, left: 0, bottom: 0, right: -labelWidth)
        labelEdgeInset = UIEdgeInsets(top: 0, left: -imageWith!, bottom: -imageHeight!-space/2.0, right: 0)
//        imageEdgeInset = UIEdgeInsetsMake(-imageSize.height/2, titleSize.width/2, imageSize.height/2, -titleSize.width/2)
//        labelEdgeInset = UIEdgeInsets(top: 0, left: (-labelWidth-imageWith!)/2.0, bottom: -imageHeight!, right: 0)
      case .ButtonEdgeInsetsStyleLeft:
        imageEdgeInset = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0);
        labelEdgeInset = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0);
      case .ButtonEdgeInsetsStyleBottom:
        imageEdgeInset = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth)
        labelEdgeInset = UIEdgeInsets(top: -imageHeight!-space/2.0, left: -imageWith!, bottom: 0, right: 0)
      case .ButtonEdgeInsetsStyleRight:
          // To Do print("坐标是====\(labelWidth)=====\(space)")
        imageEdgeInset = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0)
        labelEdgeInset = UIEdgeInsets(top: 0, left: -imageWith!-space/2.0, bottom: 0, right: imageWith!+space/2.0)
      }
      self.titleEdgeInsets = labelEdgeInset
      self.imageEdgeInsets = imageEdgeInset
  }
    
    

}
