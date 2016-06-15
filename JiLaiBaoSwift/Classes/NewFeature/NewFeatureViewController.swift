//
//  NewFeatureViewController.swift
//  JiLaiBaoSwift
//
//  Created by youmy on 16/3/15.
//  Copyright © 2016年 youmy. All rights reserved.
//  新特性

import UIKit

class NewFeatureViewController: UIViewController {
    let size = UIScreen.mainScreen().bounds.size
    
    override func viewDidLoad() {
        let sc = createScrollView({ () -> Int in
            return 4
            }) { (index) -> UIView in
                let imageView = UIImageView(frame: CGRectMake(CGFloat(index) * self.size.width, 0, self.size.width, self.size.height))
                imageView.image = UIImage(named: "guide\(index+1)")
                return imageView
        }
        view.addSubview(sc)
    }
    
    /**
     创建UIScrollView
     
     - parameter imageCount: 多少页
     - parameter createView: 每一页
     
     - returns: 返回创建好后的UIScrollView
     */
    func createScrollView(imageCount:() ->Int, createView:(index: Int) -> UIView) -> UIScrollView {
        // 1.创建ScrollView
        let scrollView = UIScrollView(frame: self.view.bounds)
        
        // 2.添加图片
        let count = imageCount() // 调用imageCount闭包，返回Int
        for i in 0..<count {
            let imageView = createView(index: i) // 调用createView闭包并传参并返回一个对象
            scrollView.addSubview(imageView)
            if i == count - 1 // 添加按钮
            {
                imageView.userInteractionEnabled = true
                imageView.addSubview(createBtn())
            }
        }
        
        // 3.设置scrollView属性
        scrollView.bounces = false
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: size.width * CGFloat(imageCount()), height: size.height)
        
        return scrollView
    }
    
    // MARK: - 创建立即理财按钮
    func createBtn() -> UIButton{
        let width:CGFloat = size.width / 2.5
        let x:CGFloat = (size.width - width) / 2.0
        let y:CGFloat = size.height <= 568 ? size.height - 60 : size.height - 80
        let height:CGFloat = 40
        
        let starBtn = UIButton(frame: CGRect(x: x, y: y, width: width, height: height))
        starBtn.setTitle("立即理财", forState: UIControlState.Normal)
        starBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        starBtn.titleLabel?.font = UIFont.systemFontOfSize(17)
        starBtn.layer.cornerRadius = 5.0
        starBtn.layer.borderWidth = 0.5;
        starBtn.layer.borderColor = UIColor.whiteColor().CGColor
        starBtn.addTarget(self, action: #selector(NewFeatureViewController.startClick), forControlEvents: UIControlEvents.TouchUpInside)
        return starBtn
    }
    
    // MARK: - 立即理财按钮点击事件
    func startClick(){
        let window:UIWindow = UIApplication.sharedApplication().keyWindow!
        window.rootViewController = MainViewController()
        
        let key = "CFBundleVersion"
        let version = NSBundle.mainBundle().infoDictionary![key]
        SaveTool.setObject(version, forKey: key)
    }
}
