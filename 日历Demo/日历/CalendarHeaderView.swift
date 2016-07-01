//
//  CalendarHeaderView.swift
//  TrainTickets
//
//  Created by Victor on 15/12/7.
//  Copyright © 2015年 Victor. All rights reserved.
//

import UIKit
struct CalendarHVDefault {
    static let VWidth:CGFloat = (ScreenUtil.width - 16 * 2) / 7
}

class CalendarHeaderView: UIView {
    let weeks = ["日", "一", "二", "三", "四", "五", "六"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        for i in 0..<7 {
            let label = UILabel()
            label.text = weeks[i]
            label.font = UIFont.boldSystemFontOfSize(13)
            label.textColor = UIColor.grayColor()
            label.textAlignment = .Center
        self.addSubview(label)
        self.backgroundColor = UIColor.whiteColor()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for i in 0..<7 {
            let view = self.subviews[i]
            view.frame = CGRect(x:16 + CalendarHVDefault.VWidth * CGFloat(i), y: 0, width: CalendarHVDefault.VWidth, height: self.frame.height)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
