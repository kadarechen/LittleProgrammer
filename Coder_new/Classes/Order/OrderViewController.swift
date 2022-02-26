//
//  OrderViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/28.
//

import UIKit
import PagingMenuController


//class OrderViewController: UIViewController {
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


private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    private let OrderviewController1 = OrderViewController1()
    private let OrderviewController2 = OrderViewController2()
    
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    fileprivate var pagingControllers: [UIViewController] {
        return [OrderviewController1, OrderviewController2]
    }
    
    fileprivate struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2()]
        }
    }
    
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "已预约"))
        }
    }
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "已完成"))
        }
    }
}

class OrderViewControoler: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        
        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        pagingMenuController.view.frame.origin.y += 100
        pagingMenuController.view.frame.size.height -= 64
        pagingMenuController.onMove = { state in
            switch state {
            case let .willMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .didMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .willMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case let .didMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case .didScrollStart:
                print("Scroll start")
            case .didScrollEnd:
                print("Scroll end")
            }
        }
        
        addChild(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMove(toParent: self)
    }
    func showConsult(){
        print("OrderVC1: consult")
        var controller:UIAlertController?
        controller = UIAlertController(title: "请拨打我们的客服介入热线", message: "请注意，一般来说，订单一旦支付不可退款。 建议您在联系客服前先与教师沟通。",preferredStyle: .actionSheet)
        let phone = UIAlertAction(title: "拨打电话：021-6765-2311",style:UIAlertAction.Style.default,handler:{(paramAction:UIAlertAction!) in})
        let cancel = UIAlertAction(title: "取消",style:UIAlertAction.Style.cancel,handler:{(paramAction:UIAlertAction!) in})
        controller!.addAction(phone)
        controller!.addAction(cancel)
        self.present(controller!, animated: true, completion: nil)
    }
    func showOrderDetail(){
        let sb = UIStoryboard(name: "OrderDetail", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "OrderDetail") as! OrderDetailViewController
        self.navigationController?.present(vc, animated: true)
    }
    func showMessage(){
        let sb = UIStoryboard(name: "Dialogue", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "Dialogue") as! DialogueViewController
        self.navigationController?.present(vc, animated: true)
    }
    func showPhone(){
        print("OrderVC1: showPhone")
        var controller:UIAlertController?
        controller = UIAlertController(title: "拨打教师的电话", message: "建议您优先采用私信联系",preferredStyle: .actionSheet)
        let phone = UIAlertAction(title: "拨打电话：135 6522 3476",style:UIAlertAction.Style.default,handler:{(paramAction:UIAlertAction!) in})
        let cancel = UIAlertAction(title: "取消",style:UIAlertAction.Style.cancel,handler:{(paramAction:UIAlertAction!) in})
        controller!.addAction(phone)
        controller!.addAction(cancel)
        self.present(controller!, animated: true, completion: nil)
    }
    @IBAction func unwindSegue(sender: UIStoryboardSegue)
    {
        print("Root Order: ender unwind")
    }
}
