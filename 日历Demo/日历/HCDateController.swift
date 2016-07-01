//
//  DateController.swift
//  TrainTickets
//
//  Created by Victor on 15/12/3.
//  Copyright © 2015年 Victor. All rights reserved.
//

import UIKit

class HCDateController: CalendarViewController {

    var daynumber = 0     //天数
    var optiondaynumber = 0//选择日期数
    var fromDate = NSDate()
    
    init(day: NSInteger, ToDateForString todate: String, block: CalendarBlock) {
        super.init()
        
        daynumber = day
        optiondaynumber = 1
        super.calendarMonth = getMonthArrayOfDayNumber(daynumber, ToDateforString: todate) as [AnyObject]
        super.collectionView.reloadData()
        
        self.calendarblock = block
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTrainToDay(day: NSInteger, ToDateForString todate:String){
        daynumber = day
        optiondaynumber = 1
        super.calendarMonth = getMonthArrayOfDayNumber(daynumber, ToDateforString: todate) as [AnyObject]
        super.collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //获取时间段内的天数数组
    func getMonthArrayOfDayNumber(day:Int, ToDateforString todate:String) -> [AnyObject]{
        let date = fromDate
        var selectdate = NSDate()
        if todate != "" {
            selectdate = selectdate.dateFromString(todate, formate: "yyyy-MM-dd")
        }
        
        super.Logic = CalendarLogic()
        return super.Logic.reloadCalendarView(date, selectDate: selectdate, days_number: day)
        
    }

}
