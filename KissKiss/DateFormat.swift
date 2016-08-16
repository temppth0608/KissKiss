//
//  DateFormat.swift
//  KissKiss
//
//  Created by snow on 2016. 8. 16..
//  Copyright © 2016년 mashup. All rights reserved.
//

import Foundation

class DateFormat {
    
    static func strigFromDate(date: NSDate) -> String{
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "yyyy년 MM월 dd일"
        return dayTimePeriodFormatter.stringFromDate(date)
    }
    
}