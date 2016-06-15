//
//  MainViewController.swift
//  JiLaiBaoSwift
//
//  Created by youmy on 16/3/15.
//  Copyright © 2016年 youmy. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        addChildViewController()
    }
    
    private func addChildViewController() {
        let path = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)
        
        if let jsonPath = path  // 可选绑定
        {
            let jsonData = NSData(contentsOfFile: jsonPath)
            do{
                let dictArr = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
                
                for dict in dictArr as! [[String : String]]
                {
                    addChildViewController(dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!, selectedImage: dict["selectedImage"]!)
                }
            }
            catch // 异常按以下加载
            {
                addChildViewController("FinaceViewController", title: "理财", imageName: "tabbar_financial_default", selectedImage: "tabbar_financial_selected")
                addChildViewController("AccountViewController", title: "帐户", imageName: "tabbar_account_default", selectedImage: "tabbar_account_selected")
                addChildViewController("MoreViewController", title: "更多", imageName: "tabbar_more_default", selectedImage: "tabbar_more_selected")
            }
        }
    }
    
    // MARK: - 添加子控制器
    private func addChildViewController(childControllerName: String, title:String, imageName: String, selectedImage:String) {
        // 获取命名空间
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        let cls:AnyClass? = NSClassFromString(ns + "." + childControllerName)
        
        let vcCls = cls as! UIViewController.Type
        let vc = vcCls.init()
        
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImage)
        vc.title = title
        
        let nav = UINavigationController()
        nav.addChildViewController(vc)
        
        addChildViewController(nav)
    }
}
