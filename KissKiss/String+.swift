//
//  StringExtension.swift
//  KissKiss
//
//  Created by 장섭 심 on 2016. 7. 24..
//  Copyright © 2016년 mashup. All rights reserved.
//

import Foundation

extension NSDateFormatter {
    convenience init(dateStyle: NSDateFormatterStyle) {
        self.init()
        self.dateStyle = dateStyle
    }
}

extension NSDate {
    struct Formatter {
        static let shortDate = NSDateFormatter(dateStyle: .MediumStyle)
    }
    
    var shortDate: String {
        return Formatter.shortDate.stringFromDate(self)
    }
}