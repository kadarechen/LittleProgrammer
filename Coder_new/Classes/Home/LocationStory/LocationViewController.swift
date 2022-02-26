//
//  LocationViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/29.
//

//city picker: https://github.com/SunLn/CnAreaPicker

import UIKit

class LocationViewController: UIViewController {
    @IBOutlet weak var autolocation: UIButton!
    @IBOutlet weak var searchview: UIView!
    @IBOutlet weak var reLocationBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var areaTextField: UITextField!
    var areaPickerView: CnAreaPickerView?
    override func viewDidLoad() {
        super.viewDidLoad()

        autolocation.layer.cornerRadius = 20.0
        autolocation.layer.borderColor = UIColor.systemGray5.cgColor
        autolocation.layer.borderWidth = 1.0
        searchview.layer.cornerRadius = 20.0
        searchview.layer.borderColor = UIColor.systemGray5.cgColor
        searchview.layer.borderWidth = 1.0
        confirmBtn.layer.cornerRadius = 20.0
        
        
        
        myLocate.province = "广东省"
        myLocate.city = "广州市"
        myLocate.area = "天河区"
        setAreaText(locate: myLocate)
        areaPickerView = CnAreaPickerView.picker(for: self, textField: areaTextField, barTintColor: UIColor.white, tintColor: UIColor.black, areaLevel: 2)
        areaTextField.delegate = self  //也个也最好实现.因为可以在将要显示PickerView的时候,主动选中一个地区.
        
        //为了点击空白的时候能够退键盘
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(viewDidTap(tapGR:)))
        tapGR.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGR)
    }
    
    @objc func viewDidTap(tapGR: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - lazy
    lazy var myLocate: CnLocation = {
        return CnLocation()
    }()
    
    @IBAction func btn1td(_ sender: UIButton) {
        sender.backgroundColor = UIColor.systemGray2
    }
    
    @IBAction func btn1tc(_ sender: UIButton) {
        sender.backgroundColor = UIColor.systemBackground
    }

}


extension LocationViewController: UITextFieldDelegate {
    
    //主动选择某一个地区,主动弹出某个区域以选中....
    func textFieldDidBeginEditing(_ textField: UITextField) {
        areaPickerView?.shouldSelected(proName: myLocate.province, cityName: myLocate.city, areaName: myLocate.area)
    }
}

extension LocationViewController: CnAreaPickerDelegate {
    func cancel(areaToolbar: CnAreaToolbar, textField: UITextField, locate: CnLocation, item: UIBarButtonItem) {
        print("点击了取消")
        //还原原来的值......
        myLocate.decription()
        setAreaText(locate: myLocate)
    }
    
    func sure(areaToolbar: CnAreaToolbar, textField: UITextField, locate: CnLocation, item: UIBarButtonItem) {
        print("点击了确定")
        //当picker定住的时候,就有会值.**********但是******************
        //picker还有转动的时候有些值是空的........取值前一定要判断是否为空.否则crash.....
        //赋值新地址......
        print("最后的值是\n")
        locate.decription()
        //        myLocate = locate //不能直接赋值地址,这个是引用来的
        myLocate.province = locate.province
        myLocate.provinceCode = locate.provinceCode
        myLocate.city = locate.city
        
        currentLocation = myLocate.city
        
        myLocate.cityCode = locate.cityCode
        myLocate.area = locate.area
        myLocate.areaCode = locate.areaCode
        
    }
    
    func statusChanged(areaPickerView: CnAreaPickerView, pickerView: UIPickerView, textField: UITextField, locate: CnLocation) {
        //立即显示新值
        print("转到的值:\n")
        locate.decription()
        if !locate.area.isEmpty {
            areaTextField.text = "\(locate.province) \(locate.city) \(locate.area)"
        } else {
            areaTextField.text = "\(locate.province) \(locate.city)"
        }
    }
    
    func setAreaText(locate: CnLocation) {
        var areaText = ""
        if locate.city.isEmpty {
            areaText = locate.province
        } else if locate.area.isEmpty {
            areaText = "\(locate.province) \(locate.city)"
        } else {
            areaText = "\(locate.province) \(locate.city) \(locate.area)"
        }
//        areaTextField.text = areaText
    }
    
}
