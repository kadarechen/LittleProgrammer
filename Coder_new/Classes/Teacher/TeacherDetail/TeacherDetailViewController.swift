//
//  TeacherDetailViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/29.
//

import UIKit

class TeacherDetailViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var message: UIButton!
    @IBOutlet weak var phone: UIButton!
    @IBOutlet weak var scrollview: UIScrollView!
    
    var currentTeacher:Teacher?
    var itemsi:[Intro]?
    var mytemp:Array<Any>?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == teaProCell{
            print("是的，和teacD Table匹配")
            return 1
        }
        else{
            print("第二个table")
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == teaProCell {
            print(tableView)
            print("进入")
            var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellID")
                let tempframe = cell.frame
                let tempcg = CGRect(x: tempframe.minX, y: tempframe.minY, width: tempframe.width, height: 100)
                cell.frame = tempcg
        //            print(cell.frame)
            cell.textLabel?.text = currentTeacher!.school! + "   " +  currentTeacher!.name!
            cell.detailTextLabel?.text = currentTeacher!.gender! + "   " +  currentTeacher!.old! + "   " +  currentTeacher!.major! + "   " +  currentTeacher!.degree!
            cell.imageView?.image = UIImage(imageLiteralResourceName: currentTeacher!.image!)
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
            princeLabel.text = "¥" + String(currentTeacher!.price) + "/时"
            princeLabel.textColor = UIColor.red
            princeLabel.font = UIFont.systemFont(ofSize: 18)
            princeLabel.textAlignment = NSTextAlignment.right
            //        cell.accessoryView?.frame = accessoryViewFrame
            cell.accessoryView?.addSubview(princeLabel)
            cell.selectionStyle = .none
            
            //set detail
            
            return cell
        }
        
        
        
        
        //剩余的介绍部分
        else {
            print("enter else")
            let cell:TeacherDetailCell = Bundle.main.loadNibNamed("TeacherDetailCell", owner:nil,  options:nil)?.first as! TeacherDetailCell
            cell.setIntro(introData: mytemp![indexPath.row] as! Intro)
//            _ = teacDetailInfo.frame
            
            
            //设置table的自定义宽度，该方法已经废弃
//            print(cell.frame)
//            let newteaDetailInfoFrame = CGRect(x: teacDetailInfo.frame.minX, y: teacDetailInfo.frame.minY, width: teacDetailInfo.frame.width, height: teacDetailInfo.frame.height + cell.frame.height)
//            teacDetailInfo.frame = newteaDetailInfoFrame
            print("newtea:")
//            print(newteaDetailInfoFrame)
//            print(teacDetailInfo.frame)
//            print(cell)
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    var teaProCell:UITableView!
    var teacDetailInfo:UITableView!
    
    
    
    lazy var teachers:[stuteacher] = {
        var teachers = [stuteacher(image: "teaPro_01.JPG", school: "上海交大", name: "Wisk老师", gender: "男", old: "20岁", major: "计算机科学", degree: "研究生", teaOld: "37", price: "100"),stuteacher(image: "teaPro_02.JPG", school: "上海交大", name: "Wisk老师", gender: "女", old: "20岁", major: "计算机科学", degree: "研究生", teaOld: "37", price: "100"),stuteacher(image: "teaPro_03.JPG", school: "上海交大", name: "Wisk老师", gender: "女", old: "20岁", major: "计算机科学", degree: "研究生", teaOld: "37", price: "100")]
        teachers[0].selfIntro = [("自我介绍","你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"),("教学案例","你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"),("获奖和项目经历","你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！")]
        return teachers
    }()
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        message.layer.cornerRadius = 20.0;//圆角的弧度
        message.layer.borderColor = UIColor.systemBlue.cgColor;//设置边框颜色
        message.layer.borderWidth = 1.0;//设置边框宽度
        phone.layer.cornerRadius = 20.0;//圆角的弧度
        phone.layer.borderColor = UIColor.systemBlue.cgColor;//设置边框颜色
        phone.layer.borderWidth = 1.0;//设置边框宽度
        self.loadCarouslView()
        
        let thisUITableViewFrame = CGRect(
            x: 0,
            y: 175,
            width: 414,
            height: 100)
        teaProCell = UITableView(frame: thisUITableViewFrame, style: .grouped)
        print("***********************************")
        print(view.bounds)
        teaProCell.backgroundColor = UIColor.systemGray6;
        scrollview.addSubview(teaProCell)
        scrollview.contentSize = CGSize(width: 414,height: 1000)
        teaProCell.dataSource = self
        teaProCell.delegate = self
        teaProCell.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        teaProCell.rowHeight = 100
        teaProCell.sectionFooterHeight = 0
        teaProCell.sectionHeaderHeight = 0
        teaProCell.separatorStyle = .none
        
        
        
        //第二个table
        let thisUITableViewFrame2 = CGRect(
            x: 0,
            y: 275,
            width: 414,
            height: 10000)
        teacDetailInfo = UITableView(frame: thisUITableViewFrame2, style: .grouped)
        print("***********************************2")
        print(teacDetailInfo.frame)
        teacDetailInfo.backgroundColor = UIColor.systemGray6;
        scrollview.addSubview(teacDetailInfo)
        teacDetailInfo.dataSource = self
        teacDetailInfo.delegate = self
        teacDetailInfo.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
//        teacDetailInfo.rowHeight = 100
        teacDetailInfo.sectionFooterHeight = 0
        teacDetailInfo.sectionHeaderHeight = 0
        teacDetailInfo.separatorStyle = .none
        
        
        
        fetchIntro()
        
        

        
    
    }
    
    func fetchIntro(){
//        print(currentTeacher?.intro)
        print("0000000000000000")

//        let a = Array((currentTeacher?.intro)!)
//        print(type(of: a))
        mytemp = Array((currentTeacher?.intro)!)
        var temp = mytemp![0]
        print((mytemp![0] as! Intro).no)
        print((mytemp![1] as! Intro).no)
        print((mytemp![2] as! Intro).no)
//        print((mytemp[1] as! Intro).title)
        for i in (0...(mytemp!.count - 2)){
            for j in ((i+1)...(mytemp!.count - 1)){
                if (mytemp![i] as! Intro).no > (mytemp![j] as! Intro).no {
                    temp = mytemp![i]
                    mytemp![i] = mytemp![j]
                    mytemp![j] = temp
                }
            }
        }
        print((mytemp![0] as! Intro).no)
        print((mytemp![1] as! Intro).no)
        print((mytemp![2] as! Intro).no)
        print(type(of: Array((currentTeacher?.intro)!)))
        print("complete: show intro")
//        let request = Intro.fetchRequest() as NSFetchRequest<Intro>
        
    }
    
    
//    func pageReture()
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        var sumOfHeight:CGFloat = 0.00
        for (_ , cell) in teacDetailInfo.subviews.enumerated() {
            if cell.isKind(of: UITableViewCell.self) {
                print("new cell")
                print(cell.frame)
                sumOfHeight += cell.frame.height
            }
        }
        print("enter viewwillapper++++++++++++++++++++++++++++++++++++")
        print(sumOfHeight)
        scrollview.contentSize = CGSize(width: 414,height: sumOfHeight + teaProCell.frame.minY + teaProCell.frame.height)

    }
    
    
    func loadCarouslView() {
        let rect = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 165)
        let carousl = CarouselView.init(frame: rect)
        self.setupImage(carousl)
        scrollview.addSubview(carousl)
    }
    
    // 设置数据源
//    func setupImage(_ carousl : CarouselView) {
//        var imageArray : Array<UIImage>! = []
//        for i in 0..<3 {
//            let imgUrl = "teacDetailBanner\(i + 1)"
//            let image = UIImage(named: imgUrl)
//            imageArray.append(image!)
//        }
//        carousl.setupBannerPages(imageArray) { (pageIndex) in
//            print("当前选中页面：\(pageIndex)")
//        }
//    }
    
    
    
    
    func setupImage(_ carousl : CarouselView) {
        var imageArray : Array<UIImage>! = []
        for i in 0..<3 {
//            let imgUrl = "teacDetailBanner\(i + 1)"
            let imgUrl = currentTeacher?.imageScroll![i]
            print(imgUrl)
            print(currentTeacher?.name)
            let image = UIImage(named: imgUrl!)
            imageArray.append(image!)
        }
        carousl.setupBannerPages(imageArray) { (pageIndex) in
            print("当前选中页面：\(pageIndex)")
        }
    }
    
    
    
    @IBAction func myback(_ sender: UIButton) {
//        self.presentingViewController!.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "backToAllTeacher", sender: nil)
        //https://blog.csdn.net/qq_35776048/article/details/54562652
    }
    
    
    
}
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == ""{
//            let secVC = segue.destination as! 对应VC的名字
//        }
//    }
    
    extension TeacherDetailViewController{
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

