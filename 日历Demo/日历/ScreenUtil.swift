//
//  ScreenUtil.swift
//  app
//
//  Created by kk on 15/9/18.
//  Copyright © 2015年 上海酷屏信息技术有限公司. All rights reserved.
//

import UIKit

struct ScreenUtil {
    
    private static var scrWidth: CGFloat = 0
    private static var scrHeight: CGFloat = 0
    private static var statusBarHeight: CGFloat = 0
    
    private static var mainScreen = UIScreen.mainScreen()
    static var navBarHeight:CGFloat = 44
    
    static var keyWindow: UIWindow? {
        
        get {
            
            return UIApplication.sharedApplication().keyWindow
            
        }
        
    }
    
    static var statusHeight: CGFloat {
        
        get {
            
            if statusBarHeight == 0 {
                
                statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
            }

            return statusBarHeight
            
        }
        
    }
    
    static var width: CGFloat {
        
        get {
            
            if scrWidth == 0 {
                
                scrWidth = mainScreen.bounds.width
                
            }
                
            return scrWidth
            
        }
        
    }
    
    static var height: CGFloat {
        
        get {
            
            if scrHeight == 0 {
                
                scrHeight = mainScreen.bounds.height
                
            }
            
            return scrHeight
            
        }
        
    }
    
}
