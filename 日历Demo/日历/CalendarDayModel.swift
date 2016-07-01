
//
//  CalendarDayModel.swift
//  TrainTickets
//
//  Created by Victor on 15/12/24.
//  Copyright © 2015年 Victor. All rights reserved.
//

import Foundation

class CalendarDayModel: NSObject {
    var style = ""
    var day = 0
    var month = 0
    var year = 0
    var week = 0
    var Chinese_calendar = ""
    var holiday = ""
    
    class func calendarDayWithYear(year:Int, month:Int, day:Int) -> CalendarDayModel{
        let calendarDay = CalendarDayModel()
        calendarDay.year = year
        calendarDay.month = month
        calendarDay.day = day
        
        return calendarDay
    }
    
    func date() -> NSDate{
        let c = NSDateComponents()
        c.year = self.year
        c.month = self.month
        c.day = self.day
        return NSCalendar.currentCalendar().dateFromComponents(c)!
    }
    
    func toString(format: String) -> String{
        let date = self.date()
        let matter = NSDateFormatter()
        matter.dateFormat = format
        let string = matter.stringFromDate(date)
        return string
    }
    
    func getWeek() -> String{
        let date = self.date()
        let week_str = date.compareIfTodayWithDate()
        return week_str
    }
    
    func isEqualTo(day:CalendarDayModel) -> Bool{
        return (self.year == day.year) && (self.month == day.month) && (self.day == day.day)
    }
}
