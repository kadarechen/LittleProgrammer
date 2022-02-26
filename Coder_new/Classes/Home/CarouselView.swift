//
//  CarouselView.swift
//  CarouselTest
//
//  轮播图控件
//

import UIKit
 

class CarouselView: UIView {
    var onPageChangedBlock:((_ pageIndex:Int)->Void)?
    var scrollView   : UIScrollView!
    var pageControl  : UIPageControl!
    var timer        : Timer!           // 定时器
    var pageCount    : Int!             // 总页数
    var prePageIndex : Int!             // 记录之前的page下标
    var imageArray   : Array<Any>!      // 存放轮播图片集合
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initWithScrollView()
        self.initWithPageControl()
        self.pageTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK : 控件初始化
    func initWithScrollView() {
        let rect = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        scrollView = UIScrollView.init(frame: rect) 
        // 设置分页效果
        scrollView.isPagingEnabled = true
        // 设置到边缘的弹性隐藏
        scrollView.bounces = false
        // 设置代理
        scrollView.delegate = self
        self.addSubview(scrollView)
    }
    
    func initWithPageControl() {
        let rect = CGRect.init(x: 0, y: self.frame.size.height - 40, width: self.frame.size.width, height: 50)
        pageControl = UIPageControl.init(frame: rect)
        // 设置当前页面索引
        pageControl.currentPage = 0
        // 设置未选中时的圆点颜色
        pageControl.pageIndicatorTintColor = UIColor.groupTableViewBackground
        // 设置选中时的圆点颜色
        pageControl.currentPageIndicatorTintColor = UIColor.red
        self.addSubview(pageControl)
    }
    
    // 开启定时器
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3,
                                     target: self,
                                     selector: #selector(changePageRight),
                                     userInfo: nil,
                                     repeats: true)
    }
    // 停止定时器
    func stopTimer() {
        timer.invalidate()
    }
    // 往右滑，永远都是滑到第三页
    @objc func changePageRight() {
        let point = CGPoint.init(x: self.frame.size.width * 2, y: 0)
        scrollView.setContentOffset(point, animated: true)
        self.resetPageIndex(true)
    }
    // 往左滑，永远都是滑动到第一页
    func changePageLeft() {
        scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: true)
        self.resetPageIndex(false)
    }
    
    // 每个页面的点击事件
    func pageTapGesture() {
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(pageIndexClick))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func pageIndexClick() {
        onPageChangedBlock!(pageControl.currentPage)
    }
}

extension CarouselView {
    //设置分页，并设置选中页回调
    func setupBannerPages(_ pageViews:Array<Any>, _ pageBlock:@escaping (_ pageIndex:Int)->Void) {
        // 图片集合
        imageArray = pageViews
        // 页数
        pageCount = pageViews.count
        // 设置滚动范围, 只有三个页面
        let rectWidth = self.frame.size.width
        let rectHeight = self.frame.size.height
        scrollView.contentSize = CGSize.init(width: rectWidth * 3, height: rectHeight)
        pageControl.numberOfPages = pageCount
        //设置回调
        onPageChangedBlock = pageBlock
        for i in 0..<3 {
            let pageImage = UIImageView.init()
            let imgRect = CGRect.init(x: rectWidth * CGFloat(i), y: 0, width: rectWidth, height: rectHeight)
            pageImage.frame = imgRect
            //设置索引
            pageImage.tag = 1000 + i
            scrollView.addSubview(pageImage)
        }
        // 设置初始展示图片
        let leftImage = scrollView.viewWithTag(1000) as! UIImageView
        let middleImage = scrollView.viewWithTag(1001) as! UIImageView
        let rightImage = scrollView.viewWithTag(1002) as! UIImageView
        // 一开始要显示中间的第一张，所以左边放最后一张，右边放第二张
        leftImage.image = (imageArray.last as! UIImage)
        middleImage.image = (imageArray.first as! UIImage)
        rightImage.image = (imageArray[1] as! UIImage)
        
        // 设置初始偏移量
        scrollView.contentOffset = CGPoint.init(x: rectWidth, y: 0)
        prePageIndex = 0
        
        // 开启定时器
        self.startTimer()
    }
    
    // 重新设置索引和页面图片  UIPageControl
    func resetPageIndex(_ isRight: Bool) {
        if isRight {
            // 根据之前的page下标来修改
            if prePageIndex == pageCount - 1 {
                //到头了就回到第一个
                pageControl.currentPage = 0
            } else {
                pageControl.currentPage = prePageIndex + 1
            }
        } else {
            if prePageIndex == 0 {
                pageControl.currentPage = pageCount - 1
            } else {
                pageControl.currentPage = prePageIndex - 1
            }
        }
        prePageIndex = pageControl.currentPage
    }
    
    //重新设置页面元素
    func resetPageView() {
        // 每次滑动完了之后又重新设置当前显示的page时中间的page
        let leftImage = scrollView.viewWithTag(1000) as! UIImageView
        let middleImage = scrollView.viewWithTag(1001) as! UIImageView
        let rightImage = scrollView.viewWithTag(1002) as! UIImageView
        if pageControl.currentPage == pageCount - 1 {
            leftImage.image = (imageArray[pageControl.currentPage - 1] as! UIImage)
            middleImage.image = (imageArray[pageControl.currentPage] as! UIImage)
            rightImage.image = (imageArray.first as! UIImage)
        } else if pageControl.currentPage == 0 {
            // 到末尾了，改成重头开始
            leftImage.image = (imageArray.last as! UIImage)
            middleImage.image = (imageArray.first as! UIImage)
            rightImage.image = (imageArray[1] as! UIImage)
        } else {
            leftImage.image = (imageArray[pageControl.currentPage - 1] as! UIImage)
            middleImage.image = (imageArray[pageControl.currentPage] as! UIImage)
            rightImage.image = (imageArray[pageControl.currentPage + 1] as! UIImage)
        }
        scrollView.contentOffset = CGPoint.init(x: self.frame.size.width, y: 0)
    }
}

//MARK ：UIScrollViewDelegate
extension CarouselView : UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // 停止定时器
        self.stopTimer()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 手动拖拽滑动结束后
        let rectWidth = self.frame.size.width
        if scrollView.contentOffset.x > rectWidth{
            // 右滑
            self.resetPageIndex(true)
        } else {
            //左滑
            self.resetPageIndex(false)
        }
        self.resetPageView()
        //开启定时器
        self.startTimer()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        // 自动滑动结束后重新设置图片
        self.resetPageView()
    }
}
