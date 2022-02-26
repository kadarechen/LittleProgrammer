//
//  MainViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/27.
//

import UIKit
import CoreData

class MainViewController: UITabBarController {

    
    @IBOutlet weak var mytabbar: UITabBar!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items:[Teacher]?


    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        deleteAllTeacher()
        print("enter viewload")
        
//        tabBar.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print("selectItem: \(item)")
        if (item.title == "私信")||(item.title == "订单")||(item.title == "个人中心")  {
            cheakIsLogin()
        }
    }

    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print("didselect:/(item)")
//    }
    
    
    func deleteAllTeacher(){
        print("enter detele all teacher")
        do{
            self.items = try context.fetch(Teacher.fetchRequest())
        }
        catch{
            print("DeleteAllTeacher: Fail to Get Data")
        }
        for i in self.items!{
            print("Delete i:")
            print(i)
            self.context.delete(i)
        }
        do{
            try self.context.save()
        }
        catch{
            print("DeleteAllTeacher: Fail to save modify")
        }
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
