//
//  DateFormat.swift
//  KissKiss
//
//  Created by snow on 2016. 8. 16..
//  Copyright © 2016년 mashup. All rights reserved.
//

import Foundation

enum 날짜포멧 {
    case 피커포멧
    case 다이어리날짜포멧
}

class DateFormat {
    static func strigFromDate(date: NSDate, 포멧: 날짜포멧) -> String{
        let dayTimePeriodFormatter = NSDateFormatter()
        switch 포멧 {
        case .피커포멧:
            dayTimePeriodFormatter.dateFormat = "yyyy년 MM월 dd일"
        case .다이어리날짜포멧:
            dayTimePeriodFormatter.dateFormat = "yyyy.MM.dd일"
        }
        return dayTimePeriodFormatter.stringFromDate(date)
    }
}
