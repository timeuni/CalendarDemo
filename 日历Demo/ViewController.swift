//
//  ViewController.swift
//  日历Demo
//
//  Created by meione on 16/7/1.
//  Copyright © 2016年 meione. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let btn = UIButton()
    
    var label = UILabel()
    
    var choiceDate = NSDate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        self.setBtn()
        
        self.setLab()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setBtn(){
        
        btn.frame.size = CGSize(width: 200, height: 100)
        
        btn.center = CGPoint(x: ScreenUtil.width / 2, y: (ScreenUtil.height - 64) / 2)
        
        btn.setTitle("选取日期", forState: .Normal)
        
        btn.backgroundColor = UIColor.blueColor()
        
        btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        btn.addTarget(self, action: #selector(self.touch), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(btn)
        
    }
    
    func setLab(){
        
        self.label.frame = CGRect(x: 0, y: 100, width: ScreenUtil.width, height: 50)
        
        self.label.font = UIFont.systemFontOfSize(16)
        
        self.label.textColor = UIColor.redColor()
        
        self.label.textAlignment = .Center
        
        self.view.addSubview(label)
        
    }
    
    // 看这儿
    func touch(){
        
        // 显示多少天内 选定的日期 回调
        let chvc = HCDateController(day: 120, ToDateForString: self.choiceDate.stringFromDate(self.choiceDate)) { (model) in
            self.label.text = "\(model.toString("MM月dd日")) \(model.getWeek())"
            self.choiceDate = model.date()
        }
        
        chvc.navigationItem.title = "日期"

        self.navigationController?.pushViewController(chvc, animated: true)
     
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

