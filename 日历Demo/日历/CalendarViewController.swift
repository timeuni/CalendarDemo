//
//  CalendarViewController.swift
//  TrainTickets
//
//  Created by Victor on 15/12/4.
//  Copyright © 2015年 Victor. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    typealias CalendarBlock = (model:CalendarDayModel)->Void

    var collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewLayout.init())//网格视图
    var calendarMonth = [AnyObject]()//每个月份的中的daymodel容器数组
    var Logic = CalendarLogic()
    var calendarblock : CalendarBlock! //回调
    var calendarblock2:((model1: CalendarDayModel, model2: CalendarDayModel) ->Void)?
    private var layout = CalendarMonthCollectionViewLayout()
    var timer = NSTimer()
    var isReturn = false
    let MonthHeader = "MonthHeaderView"
    let MonthFooter = "MonthFooterView"
    let DayCell = "DayCell"
    var first :CalendarDayModel!
    var last  :CalendarDayModel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initData()
        initView()
    }
    
    func initwithblock(block: CalendarBlock){
        calendarblock = block
    }
    
    func initView(){
        layout = CalendarMonthCollectionViewLayout()
        let Rect = CGRect(x: 0, y: 64 + 40, width: ScreenUtil.width, height: ScreenUtil.height - 64 - 40)
        collectionView = UICollectionView(frame: Rect , collectionViewLayout: layout)
        collectionView.registerClass(CalendarDayCell.self, forCellWithReuseIdentifier: DayCell)
        collectionView.registerClass(CalendarMonthHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: MonthHeader)
        collectionView.registerClass(CalendarMonthFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter , withReuseIdentifier: MonthFooter)
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        view.addSubview(CalendarHeaderView(frame: CGRect(x: 0, y: 64 , width: ScreenUtil.width, height: 40)))
    }
    
    func initData(){
        calendarMonth = [AnyObject]();//每个月份的数组
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        initData()
        initView()
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return calendarMonth.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let monthArray = calendarMonth[section]
        return monthArray.count
    }
    
//    func collectionView(collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        insetForSectionAtIndex section: Int) -> UIEdgeInsets{
//            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(DayCell, forIndexPath: indexPath)
        
        if let cacell = cell as?CalendarDayCell{
            let monthArray = calendarMonth[indexPath.section]as![NSObject]
            let model  = monthArray[indexPath.row] as?CalendarDayModel
            cacell.model = model!
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var reusableview = UICollectionReusableView()
        if kind == UICollectionElementKindSectionHeader{
            let month_Array = calendarMonth[indexPath.section]as![NSObject]
            let model = month_Array[15] as?CalendarDayModel
            let monthHeader = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: MonthHeader, forIndexPath: indexPath)as? CalendarMonthHeaderView
            monthHeader?.masterLabel.text = "\(model!.year)年 \(model!.month)月"
//            monthHeader?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
            reusableview = monthHeader!
        }
        if kind == UICollectionElementKindSectionFooter{
            let monthFooter = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: MonthFooter , forIndexPath: indexPath)as? CalendarMonthFooterView
            if indexPath.section == calendarMonth.count - 1{
                monthFooter!.backgroundColor = UIColor.whiteColor()
            }else{
                monthFooter!.backgroundColor = UIColor.lightGrayColor()
            }
                reusableview = monthFooter!
        }
        return reusableview
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let month_Array = calendarMonth[indexPath.section]as![NSObject]
        let model = month_Array[indexPath.row]as?CalendarDayModel
        if model?.style == "CellDayTypeFutur" || model?.style == "CellDayTypeWeek" || model?.style == "CellDayTypeClick"{
            Logic.selectLogic(model!)
            if !isReturn{
                if (calendarblock  != nil){
                    calendarblock(model: model!)
                    timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "onTimer", userInfo: nil, repeats: true)
                }
            }else{
                if first != nil{
                    
                }
            }
            
            
            collectionView.reloadData()
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func onTimer(){
        timer.invalidate()
        navigationController?.popViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
