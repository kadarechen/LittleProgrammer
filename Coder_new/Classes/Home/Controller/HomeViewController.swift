//
//  HomeViewController.swift
//  Coder_new
//
//  Created by 陈卓学 on 2021/3/27.
//

import UIKit
import CoreData



class HomeViewController: UIViewController {
    
    @IBOutlet weak var eventBtn: UIImageView!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items:[Teacher]?
    var itemsi:[Intro]?
    var currentLocaton:String! = "上海市"
    
    
    @IBOutlet weak var locationBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentHomeVC = self
        cheakIsLogin()

       
//        self.navigationController?.pushViewController(vc, animated: true)
        
//        self.pushViewController(vc, animated: true, completion: nil)
      
        
        
        
        
        // Do any additional setup after loading the view.
        self.loadCarouslView()
        deleteAllTeacher()
        addInitialTeacher()
        print("enter viewload")
        let imgClick = UITapGestureRecognizer()
//        let imgClick = UITapGestureRecognizer(target: self, action: "imAction")
        eventBtn.addGestureRecognizer(imgClick)
                //开启 isUserInteractionEnabled 手势否则点击事件会没有反应
        eventBtn.isUserInteractionEnabled = true
        imgClick.addTarget(self, action: #selector(tapHandler(sender:)))
        

//        @objc self.automaticallyAdjustsScrollViewInsets = NO
       
    }
    
    @objc func tapHandler(sender:UITapGestureRecognizer) {
        print("点击图片")
        currenrEvent = 100
        let sb = UIStoryboard(name: "EventPage", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "EventPage") as! EventPageViewController
        self.navigationController?.present(vc, animated: true)
    }
    
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
        do{
            self.itemsi = try context.fetch(Intro.fetchRequest())
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
    
    func addInitialTeacher(){
        print("enter addInitialTeacher")
        do{
            self.items = try context.fetch(Teacher.fetchRequest())
        }
        catch{
            print("addInitialTeacher: Fail to Get Data")
        }
        
        
        
        
        
        
//        for _ in (1...3){
//            let newTeacher = Teacher(context: self.context)
//            newTeacher.image = "teaPro_01.JPG"
//            newTeacher.school = "四川农业大学"
//            newTeacher.name = "徐元传"
//            newTeacher.gender = "男"
//            newTeacher.old = "20"
//            newTeacher.major = "计算机科学"
//            newTeacher.degree = "研究生"
//            newTeacher.price = 100
//            newTeacher.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
////            for i in (1...3){
////                let newIntro = Intro(context: self.context)
////                newIntro.no = (i as NSNumber).int64Value
////                //https://www.it1352.com/1808081.html
////                newIntro.title = "自我介绍"
////                newIntro.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
////                //relate tacher and intro
////                newIntro.teacher = newTeacher
////            }
//
//            let newIntro01 = Intro(context: self.context)
//            newIntro01.no = 1
//            newIntro01.title = "自我介绍"
//            newIntro01.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
//            //relate tacher and intro
//            newIntro01.teacher = newTeacher
//            let newIntro02 = Intro(context: self.context)
//            newIntro02.no = 2
//            newIntro02.title = "教学案例"
//            newIntro02.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
//            //relate tacher and intro
//            newIntro02.teacher = newTeacher
//            let newIntro03 = Intro(context: self.context)
//            newIntro03.no = 3
//            newIntro03.title = "获奖和项目经历"
//            newIntro03.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
//            //relate tacher and intro
//            newIntro03.teacher = newTeacher
//        }
        
        
        
        
        let newTeacher = Teacher(context: self.context)
        newTeacher.image = "teaPro_01.JPG"
        newTeacher.school = "四川农业大学"
        newTeacher.name = "徐元传"
        newTeacher.gender = "男"
        newTeacher.old = "20"
        newTeacher.major = "计算机科学"
        newTeacher.degree = "研究生"
        newTeacher.price = 100
        newTeacher.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher.teaOld = 3
        newTeacher.praScore = 92
        newTeacher.synScore = 3
        newTeacher.language = "C"
        let newIntro01 = Intro(context: self.context)
        newIntro01.no = 1
        newIntro01.title = "自我介绍"
        newIntro01.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro01.teacher = newTeacher
        let newIntro02 = Intro(context: self.context)
        newIntro02.no = 2
        newIntro02.title = "教学案例"
        newIntro02.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro02.teacher = newTeacher
        let newIntro03 = Intro(context: self.context)
        newIntro03.no = 3
        newIntro03.title = "获奖和项目经历"
        newIntro03.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro03.teacher = newTeacher
        
        
        
        
        let newTeacher1 = Teacher(context: self.context)
        newTeacher1.image = "teaPro_02.JPG"
        newTeacher1.school = "四川大学"
        newTeacher1.name = "陈大桥"
        newTeacher1.gender = "女"
        newTeacher1.old = "20"
        newTeacher1.major = "计算机科学"
        newTeacher1.degree = "研究生"
        newTeacher1.price = 50
        newTeacher1.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher1.teaOld = 4
        newTeacher1.praScore = 24
        newTeacher1.synScore = 24
        newTeacher1.language = "C++"
        let newIntro11 = Intro(context: self.context)
        newIntro11.no = 1
        newIntro11.title = "自我介绍"
        newIntro11.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro11.teacher = newTeacher1
        let newIntro12 = Intro(context: self.context)
        newIntro12.no = 2
        newIntro12.title = "教学案例"
        newIntro12.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro12.teacher = newTeacher1
        let newIntro13 = Intro(context: self.context)
        newIntro13.no = 3
        newIntro13.title = "获奖和项目经历"
        newIntro13.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro13.teacher = newTeacher1
        
        
        let newTeacher2 = Teacher(context: self.context)
        newTeacher2.image = "teaPro_03.JPG"
        newTeacher2.school = "电子科技大学"
        newTeacher2.name = "王源发"
        newTeacher2.gender = "女"
        newTeacher2.old = "20"
        newTeacher2.major = "计算机科学"
        newTeacher2.degree = "本科生"
        newTeacher2.price = 40
        newTeacher2.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher2.teaOld = 24
        newTeacher2.praScore = 56
        newTeacher2.synScore = 563
        newTeacher2.language = "Obj-C"
        let newIntro21 = Intro(context: self.context)
        newIntro21.no = 1
        newIntro21.title = "自我介绍"
        newIntro21.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro21.teacher = newTeacher2
        let newIntro22 = Intro(context: self.context)
        newIntro22.no = 2
        newIntro22.title = "教学案例"
        newIntro22.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro22.teacher = newTeacher2
        let newIntro23 = Intro(context: self.context)
        newIntro23.no = 3
        newIntro23.title = "获奖和项目经历"
        newIntro23.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro23.teacher = newTeacher2
        
        
        
        let newTeacher3 = Teacher(context: self.context)
        newTeacher3.image = "teaPro_01.JPG"
        newTeacher3.school = "四川农业大学"
        newTeacher3.name = "许知远"
        newTeacher3.gender = "男"
        newTeacher3.old = "20"
        newTeacher3.major = "计算机科学"
        newTeacher3.degree = "本科生"
        newTeacher3.price = 60
        newTeacher3.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher3.teaOld = 25
        newTeacher3.praScore = 922
        newTeacher3.synScore = 24
        newTeacher3.language = "Swift"
        let newIntro31 = Intro(context: self.context)
        newIntro31.no = 1
        newIntro31.title = "自我介绍"
        newIntro31.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro31.teacher = newTeacher3
        let newIntro32 = Intro(context: self.context)
        newIntro32.no = 2
        newIntro32.title = "教学案例"
        newIntro32.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro32.teacher = newTeacher3
        let newIntro33 = Intro(context: self.context)
        newIntro33.no = 3
        newIntro33.title = "获奖和项目经历"
        newIntro33.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro33.teacher = newTeacher3
        
        
        
        let newTeacher4 = Teacher(context: self.context)
        newTeacher4.image = "teaPro_02.JPG"
        newTeacher4.school = "四川大学"
        newTeacher4.name = "陈一身"
        newTeacher4.gender = "男"
        newTeacher4.old = "20"
        newTeacher4.major = "物联网"
        newTeacher4.degree = "本科生"
        newTeacher4.price = 90
        newTeacher4.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher4.teaOld = 24
        newTeacher4.praScore = 54
        newTeacher4.synScore = 35
        newTeacher4.language = "Python"
        let newIntro41 = Intro(context: self.context)
        newIntro41.no = 1
        newIntro41.title = "自我介绍"
        newIntro41.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro41.teacher = newTeacher4
        let newIntro42 = Intro(context: self.context)
        newIntro42.no = 2
        newIntro42.title = "教学案例"
        newIntro42.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro42.teacher = newTeacher4
        let newIntro43 = Intro(context: self.context)
        newIntro43.no = 3
        newIntro43.title = "获奖和项目经历"
        newIntro43.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro43.teacher = newTeacher4
        
        
        
        let newTeacher5 = Teacher(context: self.context)
        newTeacher5.image = "teaPro_03.JPG"
        newTeacher5.school = "电子科技大学"
        newTeacher5.name = "胡森森"
        newTeacher5.gender = "女"
        newTeacher5.old = "20"
        newTeacher5.major = "物联网"
        newTeacher5.degree = "本科生"
        newTeacher5.price = 150
        newTeacher5.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher5.teaOld = 66
        newTeacher5.praScore = 35
        newTeacher5.synScore = 466
        newTeacher5.language = "Java"
        let newIntro51 = Intro(context: self.context)
        newIntro51.no = 1
        newIntro51.title = "自我介绍"
        newIntro51.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro51.teacher = newTeacher5
        let newIntro52 = Intro(context: self.context)
        newIntro52.no = 2
        newIntro52.title = "教学案例"
        newIntro52.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro52.teacher = newTeacher5
        let newIntro53 = Intro(context: self.context)
        newIntro53.no = 3
        newIntro53.title = "获奖和项目经历"
        newIntro53.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro53.teacher = newTeacher5
        
        
        
        
        let newTeacher6 = Teacher(context: self.context)
        newTeacher6.image = "teaPro_01.JPG"
        newTeacher6.school = "四川农业大学"
        newTeacher6.name = "谢三所"
        newTeacher6.gender = "男"
        newTeacher6.old = "20"
        newTeacher6.major = "物联网"
        newTeacher6.degree = "博士生"
        newTeacher6.price = 130
        newTeacher6.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher6.teaOld = 743
        newTeacher6.praScore = 36
        newTeacher6.synScore = 35
        newTeacher6.language = "C"
        let newIntro61 = Intro(context: self.context)
        newIntro61.no = 1
        newIntro61.title = "自我介绍"
        newIntro61.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro61.teacher = newTeacher6
        let newIntro62 = Intro(context: self.context)
        newIntro62.no = 2
        newIntro62.title = "教学案例"
        newIntro62.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro62.teacher = newTeacher6
        let newIntro63 = Intro(context: self.context)
        newIntro63.no = 3
        newIntro63.title = "获奖和项目经历"
        newIntro63.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro63.teacher = newTeacher6
        
        
        
        
        let newTeacher7 = Teacher(context: self.context)
        newTeacher7.image = "teaPro_02.JPG"
        newTeacher7.school = "四川大学"
        newTeacher7.name = "李元新"
        newTeacher7.gender = "女"
        newTeacher7.old = "20"
        newTeacher7.major = "物联网"
        newTeacher7.degree = "博士生"
        newTeacher7.price = 110
        newTeacher7.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher7.teaOld = 36
        newTeacher7.praScore = 254
        newTeacher7.synScore = 35
        newTeacher7.language = "Java"
        let newIntro71 = Intro(context: self.context)
        newIntro71.no = 1
        newIntro71.title = "自我介绍"
        newIntro71.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro71.teacher = newTeacher7
        let newIntro72 = Intro(context: self.context)
        newIntro72.no = 2
        newIntro72.title = "教学案例"
        newIntro72.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro72.teacher = newTeacher7
        let newIntro73 = Intro(context: self.context)
        newIntro73.no = 3
        newIntro73.title = "获奖和项目经历"
        newIntro73.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro73.teacher = newTeacher7
        
        
        
        let newTeacher8 = Teacher(context: self.context)
        newTeacher8.image = "teaPro_03.JPG"
        newTeacher8.school = "电子科技大学"
        newTeacher8.name = "丁佳怡"
        newTeacher8.gender = "女"
        newTeacher8.old = "20"
        newTeacher8.major = "软件工程"
        newTeacher8.degree = "博士生"
        newTeacher8.price = 160
        newTeacher8.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher8.teaOld = 467
        newTeacher8.praScore = 34
        newTeacher8.synScore = 674
        newTeacher8.language = "C"
        let newIntro81 = Intro(context: self.context)
        newIntro81.no = 1
        newIntro81.title = "自我介绍"
        newIntro81.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro81.teacher = newTeacher8
        let newIntro82 = Intro(context: self.context)
        newIntro82.no = 2
        newIntro82.title = "教学案例"
        newIntro82.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro82.teacher = newTeacher8
        let newIntro83 = Intro(context: self.context)
        newIntro83.no = 3
        newIntro83.title = "获奖和项目经历"
        newIntro83.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro83.teacher = newTeacher8
        
        
        
        let newTeacher9 = Teacher(context: self.context)
        newTeacher9.image = "teaPro_01.JPG"
        newTeacher9.school = "四川大学"
        newTeacher9.name = "吴远"
        newTeacher9.gender = "男"
        newTeacher9.old = "20"
        newTeacher9.major = "软件工程"
        newTeacher9.degree = "博士生"
        newTeacher9.price = 150
        newTeacher9.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher9.teaOld = 466
        newTeacher9.praScore = 46
        newTeacher9.synScore = 464
        newTeacher9.language = "C"
        let newIntro91 = Intro(context: self.context)
        newIntro91.no = 1
        newIntro91.title = "自我介绍"
        newIntro91.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro91.teacher = newTeacher9
        let newIntro92 = Intro(context: self.context)
        newIntro92.no = 2
        newIntro92.title = "教学案例"
        newIntro92.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro92.teacher = newTeacher9
        let newIntro93 = Intro(context: self.context)
        newIntro93.no = 3
        newIntro93.title = "获奖和项目经历"
        newIntro93.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro93.teacher = newTeacher9
        
        
        
        let newTeacher10 = Teacher(context: self.context)
        newTeacher10.image = "teaPro_02.JPG"
        newTeacher10.school = "四川农业大学"
        newTeacher10.name = "刘号"
        newTeacher10.gender = "女"
        newTeacher10.old = "20"
        newTeacher10.major = "软件工程"
        newTeacher10.degree = "博士生"
        newTeacher10.price = 120
        newTeacher10.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher10.teaOld = 465
        newTeacher10.praScore = 353
        newTeacher10.synScore = 34
        newTeacher10.language = "C"
        let newIntro101 = Intro(context: self.context)
        newIntro101.no = 1
        newIntro101.title = "自我介绍"
        newIntro101.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro101.teacher = newTeacher10
        let newIntro102 = Intro(context: self.context)
        newIntro102.no = 2
        newIntro102.title = "教学案例"
        newIntro102.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro102.teacher = newTeacher10
        let newIntro103 = Intro(context: self.context)
        newIntro103.no = 3
        newIntro103.title = "获奖和项目经历"
        newIntro103.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro103.teacher = newTeacher10
        
        
        
        let newTeacher11 = Teacher(context: self.context)
        newTeacher11.image = "teaPro_03.JPG"
        newTeacher11.school = "电子科技大学"
        newTeacher11.name = "摇元"
        newTeacher11.gender = "女"
        newTeacher11.old = "20"
        newTeacher11.major = "软件工程"
        newTeacher11.degree = "大专生"
        newTeacher11.price = 70
        newTeacher11.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher11.teaOld = 456
        newTeacher11.praScore = 464
        newTeacher11.synScore = 35
        newTeacher11.language = "C"
        let newIntro111 = Intro(context: self.context)
        newIntro111.no = 1
        newIntro111.title = "自我介绍"
        newIntro111.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro111.teacher = newTeacher11
        let newIntro112 = Intro(context: self.context)
        newIntro112.no = 2
        newIntro112.title = "教学案例"
        newIntro112.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro112.teacher = newTeacher11
        let newIntro113 = Intro(context: self.context)
        newIntro113.no = 3
        newIntro113.title = "获奖和项目经历"
        newIntro113.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro113.teacher = newTeacher11
        
        
        
        let newTeacher12 = Teacher(context: self.context)
        newTeacher12.image = "teaPro_01.JPG"
        newTeacher12.school = "四川大学"
        newTeacher12.name = "谢精致"
        newTeacher12.gender = "男"
        newTeacher12.old = "20"
        newTeacher12.major = "信息管理"
        newTeacher12.degree = "大专生"
        newTeacher12.price = 60
        newTeacher12.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher12.teaOld = 35
        newTeacher12.praScore = 354
        newTeacher12.synScore = 35
        newTeacher12.language = "C"
        let newIntro121 = Intro(context: self.context)
        newIntro121.no = 1
        newIntro121.title = "自我介绍"
        newIntro121.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro121.teacher = newTeacher12
        let newIntro122 = Intro(context: self.context)
        newIntro122.no = 2
        newIntro122.title = "教学案例"
        newIntro122.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro122.teacher = newTeacher12
        let newIntro123 = Intro(context: self.context)
        newIntro123.no = 3
        newIntro123.title = "获奖和项目经历"
        newIntro123.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro123.teacher = newTeacher12
        
        
        
        let newTeacher13 = Teacher(context: self.context)
        newTeacher13.image = "teaPro_02.JPG"
        newTeacher13.school = "四川农业大学"
        newTeacher13.name = "刘子怡"
        newTeacher13.gender = "男"
        newTeacher13.old = "20"
        newTeacher13.major = "信息管理"
        newTeacher13.degree = "大专生"
        newTeacher13.price = 80
        newTeacher13.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher13.teaOld = 356
        newTeacher13.praScore = 35
        newTeacher13.synScore = 345
        newTeacher13.language = "C"
        let newIntro131 = Intro(context: self.context)
        newIntro131.no = 1
        newIntro131.title = "自我介绍"
        newIntro131.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro131.teacher = newTeacher13
        let newIntro132 = Intro(context: self.context)
        newIntro132.no = 2
        newIntro132.title = "教学案例"
        newIntro132.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro132.teacher = newTeacher13
        let newIntro133 = Intro(context: self.context)
        newIntro133.no = 3
        newIntro133.title = "获奖和项目经历"
        newIntro133.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro133.teacher = newTeacher13
        
        
        
        let newTeacher14 = Teacher(context: self.context)
        newTeacher14.image = "teaPro_03.JPG"
        newTeacher14.school = "电子科技大学"
        newTeacher14.name = "陈滋维"
        newTeacher14.gender = "女"
        newTeacher14.old = "20"
        newTeacher14.major = "信息管理"
        newTeacher14.degree = "研究生"
        newTeacher14.price = 100
        newTeacher14.imageScroll = ["teacDetailBanner1","teacDetailBanner2","teacDetailBanner3"]
        newTeacher14.teaOld = 34
        newTeacher14.praScore = 345
        newTeacher14.synScore = 656
        newTeacher14.language = "C"
        let newIntro141 = Intro(context: self.context)
        newIntro141.no = 1
        newIntro141.title = "自我介绍"
        newIntro141.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro141.teacher = newTeacher14
        let newIntro142 = Intro(context: self.context)
        newIntro142.no = 2
        newIntro142.title = "教学案例"
        newIntro142.content = "我是一名小学三年级的孩子的家长。我的孩子在学校的成绩一直都不好，他总是不爱读书，管也管不住。但是我发现他对电脑还挺有兴趣的，最近听说少儿编程特别火，我打算让他去试试。徐老师是我看下来最满意的老师，我的孩子英语不好，也许能通过他对电脑的兴趣顺便学习ー下英语。在徐老师教了我的孩子一年之后，我儿子的英语成绩居然达到了班上第二，太不可思议了！之后，我的孩子还获得了信息学奥林匹克竞赛一等奖。真的要感谢徐老师！"
        //relate tacher and intro
        newIntro142.teacher = newTeacher14
        let newIntro143 = Intro(context: self.context)
        newIntro143.no = 3
        newIntro143.title = "获奖和项目经历"
        newIntro143.content = "你好，我叫 Aice Watkins，我是一名上海交大的研究生，目前就读的是计算机科学专业。我来自美国，所以我可以用纯真的美式发音来为你的孩子教学，让孩子在学习编程的同时也能一边学英语，如果您的孩子英语基础有限，也没有关系，我会说中文，当他听不懂的时候，我可以用中文给他解释。我是计算机科学专业的学生，我会 Python、C、C++等主流语言，Scratch 当然不在话下。到目前位置，我已经辅导了 3 个孩子的少儿编程，其中有一位孩子最终获得了信息学奥林匹克竟赛少儿组一等奖，期待与你的孩子见面！"
        //relate tacher and intro
        newIntro143.teacher = newTeacher14
        
        
        
        
        do{
            try self.context.save()
        }
        catch{
            print("addInitialTeacher: Fail to save modify")
        }
    }
    
    
    
    func loadCarouslView() {
        let rect = CGRect.init(x: 0, y: 100, width: self.view.frame.size.width, height: 165)
        let carousl = CarouselView.init(frame: rect)
        self.setupImage(carousl)
        self.view.addSubview(carousl)
    }
    
    // 设置数据源
    func setupImage(_ carousl : CarouselView) {
        var imageArray : Array<UIImage>! = []
        for i in 0..<2 {
            let imgUrl = "banner_0\(i + 1)"
            let image = UIImage(named: imgUrl)
            imageArray.append(image!)
        }
        carousl.setupBannerPages(imageArray) { (pageIndex) in
            print("当前选中页面：\(pageIndex)")
            print("点击banner")
            currenrEvent = pageIndex
            let sb = UIStoryboard(name: "EventPage", bundle:nil)
            let vc = sb.instantiateViewController(withIdentifier: "EventPage") as! EventPageViewController
            self.navigationController?.present(vc, animated: true)
        }
    }
    @IBAction func unwindSegue(sender: UIStoryboardSegue)
    {
        if sender.identifier == "reLocation" {
            print("relocation：四川省-雅安市")
            locationBtn.setTitle("雅安市", for: .normal)   //Set HomeLocationButtonTitle
        }else if sender.identifier == "mannulLocation" {
            print("mannul location")
            locationBtn.setTitle(currentLocation, for: .normal)
        }
        print("home unmind")
    }

    @IBAction func consult(_ sender: UIButton) {
        print("click consult")
        var controller:UIAlertController?
        controller = UIAlertController(title: "确定要拨打电话吗？", message: "您可能需要支付一定的通话费用。 客服在线时间：9:00 - 18:00",preferredStyle: .actionSheet)
        let phone = UIAlertAction(title: "拨打电话：021-6765-2311",style:UIAlertAction.Style.default,handler:{(paramAction:UIAlertAction!) in})
        let cancel = UIAlertAction(title: "取消",style:UIAlertAction.Style.cancel,handler:{(paramAction:UIAlertAction!) in})
        controller!.addAction(phone)
        controller!.addAction(cancel)
        self.present(controller!, animated: true, completion: nil)

//        UIAlertActionStyleCancel
    }
    @IBAction func deleteData(_ sender: UIButton) {
        deleteAllTeacher()
    }
}


//message: "You cannot bring back a deleted photo",

    
