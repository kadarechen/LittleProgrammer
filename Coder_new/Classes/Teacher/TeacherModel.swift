//
//  TeacherModel.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/28.
//

import Foundation

class stuteacher {
    var image : String = "teaPro_01"
    var school : String = "四川大学"
    var name : String = "Mike"
    var gender : String = "男"
    var old : String = "23"
    var major : String = "计算机科学"
    var degree : String = "研究生"
    var teaOld : String = "30"
    var price : String = "200"
    var selfIntro : [(title: String,content:String)] = [(title:"自我介绍", content:"这是一段文字是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段是一段")]
    
    init(image:String,school : String,name : String,gender : String,old : String,major : String,degree : String,teaOld : String,price : String) {
        self.image = image
        self.school = school
        self.name = name
        self.gender = gender
        self.old = old
        self.major = major
        self.degree = degree
        self.teaOld = teaOld
        self.price = price
    }
    
    
}
