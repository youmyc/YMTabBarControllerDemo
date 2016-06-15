//
//  UIView+Extension.swift
//  JiLaiBaoSwift
//
//  Created by youmy on 16/3/15.
//  Copyright © 2016年 youmy. All rights reserved.
//

import UIKit

extension UIWindow{
    func switchRootViewController() {
        // 获取版本标识
        let key = "CFBundleVersion"
        
        // 获取保存的版本
        let lastVersion = SaveTool.objectForKey(key)
        
        // 读取App当前版本
        let currentVersion = NSBundle.mainBundle().infoDictionary![key]
        
        // 判断版本是否一致，不一致走新特性
        if currentVersion!.isEqual(lastVersion) {
            self.rootViewController = MainViewController()
        }else{
            self.rootViewController = NewFeatureViewController()
        }
    }
}