//
//  CalendarMonthHeaderView.swift
//  TrainTickets
//
//  Created by Victor on 15/12/4.
//  Copyright © 2015年 Victor. All rights reserved.
//

import UIKit

class CalendarMonthHeaderView: UICollectionReusableView {
    var masterLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        clipsToBounds = true
        masterLabel.frame = self.bounds
        masterLabel.textAlignment = .Center
        masterLabel.font = UIFont.boldSystemFontOfSize(13)
        masterLabel.textColor = UIColor.grayColor()
        addSubview(masterLabel)
    }
}
