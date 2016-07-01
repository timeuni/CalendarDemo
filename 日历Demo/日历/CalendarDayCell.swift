//
//  CalendarDayCell.swift
//  TrainTickets
//
//  Created by Victor on 15/12/4.
//  Copyright © 2015年 Victor. All rights reserved.
//

import UIKit

class CalendarDayCell: UICollectionViewCell {
    var day_lab = UILabel() //今天的日期或者节日 农历
    var day_title = UILabel()  //显示标签 日期 公历
    var imgview = UIImageView()  //选中时的图片
    var model = CalendarDayModel() {
        
        didSet {
            
            if model == oldValue {
                
                return
                
            }
            
            initView()
            
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //日期
        day_lab = UILabel(frame: CGRect(x: 0, y: 5, width: bounds.size.width, height: 20))
        day_lab.textAlignment = .Center
        day_lab.font = UIFont.systemFontOfSize(14)
        addSubview(day_lab)
        //农历
        day_title = UILabel(frame: CGRect(x: 0, y: bounds.size.height - 20, width: bounds.size.width, height: 20))
        day_title.textColor = UIColor.blackColor()
        day_title.font = UIFont.boldSystemFontOfSize(9)
        day_title.textAlignment = .Center
        addSubview(day_title)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func initView(){
        
        
        switch (model.style) {
        case "CellDayTypeEmpty": //不显示
            hidden_true()
            self.backgroundColor = UIColor.clearColor()
            break
            
        case "CellDayTypePast": //过去的日期
            hidden_false()
            if model.holiday != "" {
                day_lab.text = model.holiday
            }else{
                day_lab.text = "\(model.day)"
            }
            day_title.textColor = UIColor.lightGrayColor()
            day_lab.textColor = UIColor.lightGrayColor()
            day_title.text = model.Chinese_calendar;
            self.backgroundColor = UIColor.clearColor()
            break
            
        case "CellDayTypeFutur"://将来的日期
            self.hidden_false()
            
            if model.holiday != "" {
                day_lab.text = model.holiday;
                day_lab.textColor = UIColor.orangeColor()
            }else{
                day_lab.text = "\(model.day)"
                day_lab.textColor = UIColor.blackColor()
            }
            day_title.textColor = UIColor.blackColor()
            day_title.text = model.Chinese_calendar;
            imgview.hidden = true
            self.backgroundColor = UIColor.clearColor()
            break
            
        case "CellDayTypeWeek"://周末
            hidden_false()
            
            if model.holiday != "" {
                day_lab.text = model.holiday
                day_lab.textColor = UIColor.orangeColor()
            }else{
                day_lab.text = "\(model.day)"
                day_lab.textColor = UIColor.blackColor()
            }
            day_title.textColor = UIColor.blackColor()
            day_title.text = model.Chinese_calendar
            imgview.hidden = true
            self.backgroundColor = UIColor.clearColor()
            break
            
        case "CellDayTypeClick"://被点击的日期
            hidden_false()
            day_lab.text = "\(model.day)"
            day_lab.textColor = UIColor.whiteColor()
            day_title.text = model.Chinese_calendar;
            day_title.textColor = UIColor.whiteColor()
            self.layer.cornerRadius = 5
            self.layer.masksToBounds = true
            self.backgroundColor = UIColor.orangeColor()
            
            break
        default:
            break
        }
    }
    
    func hidden_true(){
        day_lab.hidden = true
        day_title.hidden = true
    }
    
    func hidden_false(){
        day_lab.hidden = false
        day_title.hidden = false
    }
    
    
}
