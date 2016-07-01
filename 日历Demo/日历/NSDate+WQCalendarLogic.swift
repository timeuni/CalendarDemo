//
//  NSDate+WQCalendarLogic.swift
//  app
//
//  Created by Victor on 15/12/24.
//  Copyright © 2015年 上海酷屏信息技术有限公司. All rights reserved.
//

import Foundation

extension NSDate{
    /*计算这个月有多少天*/
    func numberOfDaysInCurrentMonth() -> NSInteger{
        return NSCalendar.currentCalendar().rangeOfUnit(.Day , inUnit: .Month, forDate: self).length
    }
    
    //获取这个月有多少周
    func numberOfWeeksInCurrentMonth() -> NSInteger{
        let weekday = firstDayOfCurrentMonth().weeklyOrdinality()
        var days = numberOfDaysInCurrentMonth()
        var weeks = 0
        
        if weekday > 1{
            weeks += 1; days -= (7 - weekday + 1)
        }
        weeks += (days / 7)
        weeks += (days % 7 > 0) ? 1 : 0
        return weeks
    }
    
    /*计算这个月的第一天是礼拜几*/
    func weeklyOrdinality() -> NSInteger{
        return NSCalendar.currentCalendar().ordinalityOfUnit(NSCalendarUnit.Day , inUnit: NSCalendarUnit.WeekOfMonth , forDate: self)
    }
    
    //计算这个月最开始的一天
    func firstDayOfCurrentMonth() -> NSDate{
        var startDate : NSDate? = nil
        let ok = NSCalendar.currentCalendar().rangeOfUnit(.Month, startDate: &startDate, interval: nil, forDate: self)
        assert(ok, "Failed to calculate the first day of the month based on \(self)")
        return startDate!
    }
    
    func lastDayOfCurrentMonth() -> NSDate{
        let dateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: self)
        dateComponents.day = numberOfDaysInCurrentMonth()
        return NSCalendar.currentCalendar().dateFromComponents(dateComponents)!
    }
    
    //上一个月
    func dayInThePreviousMonth() -> NSDate{
        let dateComponents = NSDateComponents()
        dateComponents.month = -1;
        return NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: .MatchStrictly)!
    }
    
    //下一个月
    func dayInTheFollowingMonth() -> NSDate{
        let dateComponents = NSDateComponents()
        dateComponents.month = 1;
        return NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: .MatchStrictly)!
    }
    
    //获取当前日期之后的几个月
    func dayInTheFollowingMonth(month: NSInteger) -> NSDate{
        let dateComponents = NSDateComponents()
        dateComponents.month = month;
        return NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: .MatchStrictly)!
    }
    
    //获取当前日期之后的几个天
    func dayInTheFollowingDay(day: NSInteger) -> NSDate{
        let dateComponents = NSDateComponents()
        dateComponents.day = day
        return NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: .MatchStrictly)!
    }
    
    
    //获取年月日对象
    func YMDComponents() -> NSDateComponents{
        return NSCalendar.currentCalendar().components([.Year,.Month,.Day,.Weekday], fromDate: self)
    }
    
    
    //-----------------------------------------
    //
    //NSString转NSDate
    func dateFromString(dateString: String, formate: String) -> NSDate{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = formate
        return dateFormatter.dateFromString(dateString)!
    }
    
    
    
    //NSDate转NSString
    func stringFromDate(date: NSDate) -> String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.stringFromDate(date)
    }
    
    class func getDayNumbertoDay(today: NSDate, beforDay: NSDate) -> NSInteger{
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let components = calendar?.components(NSCalendarUnit.Day, fromDate: today, toDate: beforDay, options: .MatchStrictly)
        return (components?.day)!
    }
    
    //周日是“1”，周一是“2”...
    func getWeekIntValueWithDate() -> NSInteger{
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierChinese)
        let comps = calendar?.components([.Year, .Month, .Day, .Weekday], fromDate: self)
        return (comps?.weekday)!
    }
    
    //判断日期是今天,明天,后天,周几
    func compareIfTodayWithDate() -> String{
        let todate = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierChinese)
        let comps_today = calendar?.components([.Year, .Month, .Day, .Weekday], fromDate: todate)
        let comps_other = calendar?.components([.Year, .Month, .Day, .Weekday], fromDate: self)
        let weekIntValue = getWeekIntValueWithDate()
        if comps_today?.year == comps_other?.year && comps_today?.month == comps_other?.month && comps_today?.day == comps_other?.day{
            return "今天"
        }
        if comps_today?.year == comps_other?.year && comps_today?.month == comps_other?.month && ((comps_today?.day)! - (comps_other?.day)!) ==  -1{
            return "明天"
        }
        if comps_today?.year == comps_other?.year && comps_today?.month == comps_other?.month && ((comps_today?.day)! - (comps_other?.day)!) ==  -2{
            return "后天"
        }else{
            return NSDate.getWeekStringFromInteger(weekIntValue)
        }
        
    }
    
    
    
    //通过数字返回星期几
    class func getWeekStringFromInteger(week: NSInteger) -> String{
    var str_week = ""
    switch (week) {
        case 1:
            str_week = "周日"
            break;
        case 2:
            str_week = "周一"
            break;
        case 3:
            str_week = "周二"
            break;
        case 4:
            str_week = "周三"
            break;
        case 5:
            str_week = "周四"
            break;
        case 6:
            str_week = "周五"
            break;
        case 7:
            str_week = "周六"
            break;
        default:
            break
    }
        return str_week;
    }


}
