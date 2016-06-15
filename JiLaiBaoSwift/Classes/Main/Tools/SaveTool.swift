//
//  SaveTool.swift
//  JiLaiBaoSwift
//
//  Created by youmy on 16/3/15.
//  Copyright © 2016年 youmy. All rights reserved.
//

import Foundation

class SaveTool: NSObject {
    class func objectForKey(defaultName: String) ->AnyObject? {
        let value = NSUserDefaults.standardUserDefaults().objectForKey(defaultName)
        return value
    }
    
    class func setObject(value: AnyObject?, forKey: String) {
        NSUserDefaults.standardUserDefaults().setObject(value, forKey: forKey)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func boolForKey(defaultName: String) ->Bool {
        let value = NSUserDefaults.standardUserDefaults().boolForKey(defaultName)
        return value
    }
    
    class func setBool(value: Bool, forKey: String) {
        NSUserDefaults.standardUserDefaults().setObject(value, forKey: forKey)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func integerForKey(defaultName: String) ->Int {
        let value = NSUserDefaults.standardUserDefaults().integerForKey(defaultName)
        return value
    }
    
    class func setInteger(value: Int, forKey: String) {
        NSUserDefaults.standardUserDefaults().setObject(value, forKey: forKey)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}
