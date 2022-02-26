//
//  Overall.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/4/13.
//

import Foundation

var over = 10
var currentLocation:String = ""
var currenrEvent = 0


//https://blog.csdn.net/weixin_34067049/article/details/91794844
//get current viewcontroller
func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
}



//https://blog.csdn.net/wm9028/article/details/106232404
var isLogin = false
var currentHomeVC:HomeViewController!

func cheakIsLogin(){
    if isLogin == false{
        let sb = UIStoryboard(name: "Login", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen;
        currentHomeVC.navigationController?.present(vc, animated: true, completion: nil)
//        isLogin = true
    }
}
