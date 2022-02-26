//
//  TeacherViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/28.
//


import UIKit
import CoreData


//MARK:- load data
class TeacherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    

    
    
    
    //return how many rows
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return teachers.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items!.count == 0 {
            AllTeacher.sectionFooterHeight = 100
        }else{
            AllTeacher.sectionFooterHeight = 0
        }
        return items!.count
    }
   
    
    
    
    //return cell
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
//        cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellID")
////        cell.textLabel?.text="\(indexPath.row)"
//        cell.textLabel?.text = teachers[indexPath.row].school + "   " +  teachers[indexPath.row].name
//// 太长了，长度超出限制
////        cell.detailTextLabel?.text = teachers[indexPath.row].gender + "   " +  teachers[indexPath.row].old + "   " +  teachers[indexPath.row].major + "   " +  teachers[indexPath.row].degree + "   " + "已授" + teachers[indexPath.row].teaOld + "课"
//        cell.detailTextLabel?.text = teachers[indexPath.row].gender + "   " +  teachers[indexPath.row].old + "   " +  teachers[indexPath.row].major + "   " +  teachers[indexPath.row].degree
//        cell.imageView?.image = UIImage(imageLiteralResourceName: teachers[indexPath.row].image)
//        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
//
//        //set price
//        cell.accessoryType = UITableViewCell.AccessoryType.none
//        let accessoryViewFrame = CGRect(
//            x: 0,
//            y: 0,
//            width: 80,
//            height: AllTeacher.rowHeight)
//        cell.accessoryView = UIView(frame: accessoryViewFrame)
//        let princeLabel = UILabel(frame: accessoryViewFrame)
//        princeLabel.text = "¥" + teachers[indexPath.row].price + "/时"
//        princeLabel.textColor = UIColor.red
//        princeLabel.font = UIFont.systemFont(ofSize: 18)
//        princeLabel.textAlignment = NSTextAlignment.right
//        //        cell.accessoryView?.frame = accessoryViewFrame
//        cell.accessoryView?.addSubview(princeLabel)
//
//        //set detail
//
//        return cell
//    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellID")
        cell.textLabel?.text = items![indexPath.row].school! + "   " +  items![indexPath.row].name!
        cell.detailTextLabel?.text = items![indexPath.row].gender! + "   " +  items![indexPath.row].old! + "   " +  items![indexPath.row].major! + "   " +  items![indexPath.row].degree!
        cell.imageView?.image = UIImage(imageLiteralResourceName: items![indexPath.row].image!)
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        //set price
        cell.accessoryType = UITableViewCell.AccessoryType.none
        let accessoryViewFrame = CGRect(
            x: 0,
            y: 0,
            width: 80,
            height: AllTeacher.rowHeight)
        cell.accessoryView = UIView(frame: accessoryViewFrame)
        let princeLabel = UILabel(frame: accessoryViewFrame)
        princeLabel.text = "¥" + String(items![indexPath.row].price) + "/时"
        princeLabel.textColor = UIColor.red
        princeLabel.font = UIFont.systemFont(ofSize: 18)
        princeLabel.textAlignment = NSTextAlignment.right
        cell.accessoryView?.addSubview(princeLabel)
        
        
        return cell
    }
    
    
    
    
    
    
    
//    let tea = stuteacher(image: "daa", school: "daa", name: "daa", gender: "daa", old: "daa", major: "daa", degree: "daa", teaOld: "daa", price: "daa")
    
    lazy var teachers:[stuteacher] = {
        var teachers = [stuteacher(image: "teaPro_01.JPG", school: "上海交大", name: "Wisk老师", gender: "男", old: "20岁", major: "计算机科学", degree: "研究生", teaOld: "37", price: "100"),stuteacher(image: "teaPro_02.JPG", school: "上海交大", name: "Wisk老师", gender: "女", old: "20岁", major: "计算机科学", degree: "研究生", teaOld: "37", price: "100"),stuteacher(image: "teaPro_03.JPG", school: "上海交大", name: "Wisk老师", gender: "女", old: "20岁", major: "计算机科学", degree: "研究生", teaOld: "37", price: "100")]
        return teachers
    }()
    
    
    //lazy load example
//    lazy var names : [String] = {
//           let names = ["wwww", "hhhh", "yyyy"]
//            return names
//        }()
    
    
    
    
    
    
    
    
    
//MARK:- 设置全局变量
    var AllTeacher:UITableView!
    var currentClickPath:IndexPath = []

    
    
    
    
    
    //transfer filtermenu data
    let titles = ["综合排序","性别不限","学历不限","更多筛选"]
    
    //
    let source0 = ["综合排序","口碑最好","价格最高","价格最低","授课最多"]
//    let source0_0 = ["不限","弟子规","圣人训","首孝悌","次谨信","泛爱众","而亲仁","有余力","则学文"]
//    let source0_1 = ["不限","父母呼","应勿缓","父母命","行勿懒","父母教","须敬听","父母责","须顺承","冬则温","夏则凊"]
    
    let source1 = ["性别不限","男","女"]
    let source2 = ["学历不限","大专生","本科生","研究生","博士生"]
    
    //CollectionView
    let source3 = ["语言","专业"]
    let source3_0 = ["Scratch","Python","C","C++","Java","html/css","Swift","Obj-C"]
    let source3_1 = ["计算机科学","软件工程","信息管理","物联网"]
//    let source3_2 = ["亲所好","力为具","亲所恶"]
    
    
    
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    
    var items:[Teacher]?
    var tableIsEmpty = false
    
    
    
    
    
//MARK:- THIS IS DIDLOAD
    //add wight
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let menu = XYXFilterMenu.init(frame: CGRect(x: 0, y: 90, width: XYX_SCREEN_WIDTH, height: 44))
        menu.dataSource = self
        menu.delegate = self
        self.view.addSubview(menu)
        
//        var fsf = teachers[0]

        
        
        
//MARK:- DIDLOAD AllTeacherTable
        let thisUITableViewFrame = CGRect(
            x: 0,
            y: 130,
            width: 414,
            height: 896-130)
        AllTeacher = UITableView(frame: thisUITableViewFrame, style: .grouped)
        print("***********************************")
        print(view.bounds)
        AllTeacher.sectionHeaderHeight = 0
        AllTeacher.dataSource = self
        AllTeacher.delegate = self
        AllTeacher.backgroundColor = UIColor.systemGray6
        AllTeacher.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        AllTeacher.rowHeight = 100
        
        view.addSubview(AllTeacher)

        
        fetchTeacher()
        
        
        
    }
    
    
    func fetchTeacher() {
        //fetch the data from coredata to display in a tableview
        do{
            self.items = try context.fetch(Teacher.fetchRequest())
            DispatchQueue.main.async {
                self.AllTeacher.reloadData()
            }
        }
        catch{
            print("fetchTeacher: error")
        }
    }
    
    
    
    
    func updateTable(table: [XYXFilterIndexPath]?, collection:[XYXFilterIndexPath]?){
        
        
        let request = Teacher.fetchRequest() as NSFetchRequest<Teacher>
        var filter = ""
        var firstFilter = true
        
        func addNewFilter(newfilter: String){
            if firstFilter == true {
                filter = newfilter
                firstFilter = false
            }else{
                filter = filter + " and " + newfilter
            }
        }
        
        for i in table!{
            switch i.column {
            case 0:
                switch i.row {
                case 0:
                    let sort = NSSortDescriptor(key: "synScore",ascending: false)
                    request.sortDescriptors = [sort]
                case 1:
                    let sort = NSSortDescriptor(key: "praScore",ascending: false)
                    request.sortDescriptors = [sort]
                case 2:
                    let sort = NSSortDescriptor(key: "price",ascending: false)
                    request.sortDescriptors = [sort]
                case 3:
                    let sort = NSSortDescriptor(key: "price",ascending: true)
                    request.sortDescriptors = [sort]
                case 4:
                    let sort = NSSortDescriptor(key: "teaOld",ascending: false)
                    request.sortDescriptors = [sort]
                default:
                    print("updatetable: column=0 error")
                }
            case 1:
                switch i.row {
                case 0:
                    break
                case 1:
                    addNewFilter(newfilter: "gender CONTAINS '男'")
                    
                case 2:
                    addNewFilter(newfilter: "gender CONTAINS '女'")
                default:
                    break
                }
            case 2:
                switch i.row {
                case 0:
                    break
                case 1:
                    addNewFilter(newfilter: "degree CONTAINS '大专生'")
                case 2:
                    addNewFilter(newfilter: "degree CONTAINS '本科生'")
                case 3:
                    addNewFilter(newfilter: "degree CONTAINS '研究生'")
                case 4:
                    addNewFilter(newfilter: "degree CONTAINS '博士生'")
                default:
                    break
                }
            default:
                print("updatetable: table not found")
            }
        }
        for i in collection!{
            switch i.row {
            case 0:
                switch i.item {
                case 0:
                    addNewFilter(newfilter: "language CONTAINS 'Scratch'")
                case 1:
                    addNewFilter(newfilter: "language CONTAINS 'Python'")
                case 2:
                    addNewFilter(newfilter: "language CONTAINS 'C'")
                case 3:
                    addNewFilter(newfilter: "language CONTAINS 'C++'")
                case 4:
                    addNewFilter(newfilter: "language CONTAINS 'Java'")
                case 5:
                    addNewFilter(newfilter: "language CONTAINS 'html/css'")
                case 6:
                    addNewFilter(newfilter: "language CONTAINS 'Swift'")
                case 7:
                    addNewFilter(newfilter: "language CONTAINS 'Obj-C'")
                default:
                    break
                }
            case 1:
                switch i.item {
                case 0:
                    addNewFilter(newfilter: "major CONTAINS '计算机科学'")
                case 1:
                    addNewFilter(newfilter: "major CONTAINS '软件工程'")
                case 2:
                    addNewFilter(newfilter: "major CONTAINS '信息管理'")
                case 3:
                    addNewFilter(newfilter: "major CONTAINS '物联网'")
                default:
                    break
                }
            default:
                break
            }
        }
        if filter != "" {
            let finalFilter = NSPredicate(format: filter)
            request.predicate = finalFilter
        }
        do {
            self.items =  try context.fetch(request)
        }
        catch{
            
        }
        DispatchQueue.main.async {
            self.AllTeacher.reloadData()
        }
        

    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! TeacherDetailViewController
        nextVC.currentTeacher = items![sender as! Int]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backSegue(segue : UIStoryboardSegue){
        print("im back")
        print("ender back")
        delay(by: 0.3) {
            print("3秒后执行")
            self.AllTeacher.deselectRow(at: self.currentClickPath, animated: true)
        }
    }
    
    
}




//MARK:- transfar data to function
extension TeacherViewController:XYXFilterMenuDataSource{
    func menu(_ menu: XYXFilterMenu, shouldChange title: String, for indexPath: XYXFilterIndexPath) -> String? {
        return title == "不限" ? titles[indexPath.column!] : nil
    }
    
    //-----------------------------------------------
    
    
    
    //transfer source
    func menu(_ menu: XYXFilterMenu, numberOfRowsAt indexPath: XYXFilterIndexPath) -> Int {
        guard indexPath.column != nil else {
            return 0
        }
        switch indexPath.column! {
        case 0:
            return source0.count
        case 1:
            return source1.count
        case 2:
            return source2.count
        case 3:
            return source3.count
        default:
            return 0
        }
    }
    
    func menu(_ menu: XYXFilterMenu, numberOfItemsAt indexPath: XYXFilterIndexPath) -> Int {
        guard indexPath.column != nil && indexPath.row != nil else {
            return 0
        }
        switch indexPath.column! {
//        case 0:
//            if indexPath.row == 0{
//                return source0_0.count
//            }else if indexPath.row == 1{
//                return source0_1.count
//            }
//            return 0

        case 3:
            if indexPath.row == 0{
                return source3_0.count
            }else if indexPath.row == 1{
                return source3_1.count
            }
//            else if indexPath.row == 2{
//                return source3_2.count
//            }
            return 0

        default:
            return 0
        }
    }
    
    func menu(_ menu: XYXFilterMenu, titleOfRowAt indexPath: XYXFilterIndexPath) -> String {
        let defaultString = ""
        guard indexPath.column != nil && indexPath.row != nil else {
            return defaultString
        }
        switch indexPath.column! {
        case 0:
            return source0[indexPath.row!]
        case 1:
            return source1[indexPath.row!]
        case 2:
            return source2[indexPath.row!]
        case 3:
            return source3[indexPath.row!]
        default:
            return defaultString
        }
    }
    
    func menu(_ menu: XYXFilterMenu, titleOfItemAt indexPath: XYXFilterIndexPath) -> String {
        let defaultString = ""
        guard indexPath.column != nil && indexPath.row != nil && indexPath.item != nil else {
            return defaultString
        }
        if indexPath.column == 0 {
            if indexPath.row == 0 {
//                return source0_0[indexPath.item!]
                return defaultString
            }else if indexPath.row == 1{
//                return source0_1[indexPath.item!]
                return defaultString
            }
        }else if indexPath.column == 3 {
            switch indexPath.row!{
            case 0:
                return source3_0[indexPath.item!]
            case 1:
                return source3_1[indexPath.item!]
//            case 2:
//                return source3_2[indexPath.item!]
            default:
                return defaultString
            }
        }
        return defaultString
    }
    
    //-----------------------------------------------
    
    func numberOfColumns(menu: XYXFilterMenu) -> Int {
        return titles.count
    }
    
    func menu(_ menu: XYXFilterMenu, titleOfColumnAt index: Int) -> String {
        return titles[index]
    }
    
    
    
    //MARK: - Custom filting mode
    func menu(_ menu: XYXFilterMenu, typeOfColumn: Int) -> XYXFilterView.ColumnType.RawValue {
        switch typeOfColumn {
//        case 0:
//            return XYXFilterView.ColumnType.TableViewTwo.rawValue
//        case 1...2:
//            return XYXFilterView.ColumnType.TableViewOne.rawValue
        case 0...2:
            return XYXFilterView.ColumnType.TableViewOne.rawValue
        default:
            return XYXFilterView.ColumnType.CollectionView.rawValue
        }
    }
    
    func menu(_ menu: XYXFilterMenu, widthOf tableView: UITableView, at column: Int) -> CGFloat {
        if column == 0 {
            if tableView.tag == XYXFilterView.firstTabViewTag{
                return XYX_SCREEN_WIDTH * 0.35
            }else if tableView.tag == XYXFilterView.secondTabViewTag{
                return XYX_SCREEN_WIDTH * 0.65
            }
        }
        return XYX_SCREEN_WIDTH/2
    }
    
    func menu(_ menu: XYXFilterMenu, filterContentHeightAt column: Int) -> CGFloat {
        if column == 3 {
            
            if UIScreen.main.bounds.height == 812{
                return XYX_SCREEN_HEIGHT - menu.frame.maxY - 34
            }else{
                return XYX_SCREEN_HEIGHT - menu.frame.maxY
            }
        }
        return 300.0
    }

}




//MARK:- Click-event listening delegate

extension TeacherViewController:XYXFilterMenuDelegate{
    func menu(_ menu:XYXFilterMenu, tapIndex: Int) {
        print("被点击的是第\(tapIndex)列")
    }
}


//tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath):
extension TeacherViewController{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("点击\(indexPath[1])")
        currentClickPath = indexPath
        print(currentClickPath.row)
//        let sb = UIStoryboard(name: "TeacherDetail", bundle:nil)
//        let vc = sb.instantiateViewController(withIdentifier: "TeacherDetail") as! TeacherDetailViewController
////        self.navigationController?.pushViewController(vc, animated: true)
//        self.navigationController?.present(vc, animated: true)
        self.performSegue(withIdentifier: "showTeacherDetail", sender: currentClickPath.row)
    
        
    }
    
    @IBAction func unwindSegue(sender: UIStoryboardSegue)
    {
        print("ender unwind")
        delay(by: 0.3) {
            print("3秒后执行")
            self.AllTeacher.deselectRow(at: self.currentClickPath, animated: true)
        }
//        AllTeacher.deselectRow(at: currentClickPath, animated: true)
        print("aaa")
    }
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == ""{
//            let secVC = segue.destination as! secondviewcontroller
//            secVC.stu = stu
//        }
//    }
    
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        //创建一个ContactAdd类型的按钮
        let button:UIButton = UIButton(type:.system)
        button.setTitleColor(.systemGray, for: .normal)
        //设置按钮位置和大小
//        button.frame = CGRect(x:10, y:150, width:100, height:30)
        //设置按钮文字
        button.setTitle("没有符合条件的教师", for:.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
//        self.view.addSubview(button)
        return button
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0.01
    }
}
