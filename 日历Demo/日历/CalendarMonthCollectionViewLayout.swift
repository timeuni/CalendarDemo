//
//  CalendarMonthCollectionViewLayout.swift
//  TrainTickets
//
//  Created by Victor on 15/12/4.
//  Copyright © 2015年 Victor. All rights reserved.
//

import UIKit

class CalendarMonthCollectionViewLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
            headerReferenceSize = CGSizeMake(ScreenUtil.width, 36)//头部视图的框架大小
            footerReferenceSize = CGSizeMake(ScreenUtil.width, 10)
            sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            itemSize = CGSizeMake((ScreenUtil.width - 16 * 2) / 7, 40)////每个cell的大小
            
            minimumLineSpacing = 0  //每行的最小间距
            
            minimumInteritemSpacing = 0 //每列的最小间距
        
        
    }
    
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var answer = super.layoutAttributesForElementsInRect(rect)
        let missingSections = NSMutableIndexSet()
        for layoutAttributes in answer!{
            if layoutAttributes.representedElementCategory == .Cell {
                missingSections.addIndex(layoutAttributes.indexPath.section)
            }
        }
        
        for layoutAttributes in answer!{
            if layoutAttributes.representedElementKind == UICollectionElementKindSectionHeader{
                missingSections.removeIndex(layoutAttributes.indexPath.section)
            }
        }
        
        missingSections.enumerateIndexesUsingBlock { (idx: NSInteger, stop) -> Void in
            let indexPath = NSIndexPath(forItem: 0, inSection: idx)
            let layoutAttributes = self.layoutAttributesForSupplementaryViewOfKind(UICollectionElementKindSectionHeader, atIndexPath: indexPath)
            
            answer?.append(layoutAttributes!)
        }
//        for layoutAttributes in answer!{
//            if layoutAttributes.representedElementKind == UICollectionElementKindSectionHeader{
//                let section = layoutAttributes.indexPath.section
//                let numberOfItemsInSection = cv.numberOfItemsInSection(section)
//                
//                let firstObjectIndexPath = NSIndexPath(forItem: 0, inSection: section)
//                let lastObjectIndexPath = NSIndexPath(forItem: max(0, (numberOfItemsInSection - 1)) , inSection: section)
//                var firstObjectAttrs = UICollectionViewLayoutAttributes()
//                var lastObjectAttrs = UICollectionViewLayoutAttributes()
//                
//                if numberOfItemsInSection > 0{
//                    firstObjectAttrs = layoutAttributesForItemAtIndexPath(firstObjectIndexPath)!
//                    lastObjectAttrs = layoutAttributesForItemAtIndexPath(lastObjectIndexPath)!
//                }else{
//                    firstObjectAttrs = layoutAttributesForSupplementaryViewOfKind(UICollectionElementKindSectionHeader, atIndexPath: firstObjectIndexPath)!
//                    lastObjectAttrs = layoutAttributesForSupplementaryViewOfKind(UICollectionElementKindSectionFooter, atIndexPath: lastObjectIndexPath)!
//                }
//                let headerHeight = CGRectGetHeight(layoutAttributes.frame)
//                var origin = layoutAttributes.frame.origin
////                origin.y = min(max(contentOffset.y + cv.contentInset.top, CGRectGetMinY(firstObjectAttrs.frame) - headerHeight), CGRectGetMaxY(lastObjectAttrs.frame) - headerHeight)
//                
//                layoutAttributes.zIndex = 1024;
//                layoutAttributes.frame = CGRect(origin: origin, size: layoutAttributes.frame.size)
//                
//            }
//        }
        return answer
    }

//    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
//        return true
//    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
