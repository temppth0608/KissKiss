//
//  Picker.swift
//  KissKiss
//
//  Created by snow on 2016. 8. 16..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit
import LGAlertView

class DatePicker {
    static func show(view: UIView, onSelected: ((NSDate) -> Void)? = nil) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .Date
        datePicker.frame = CGRectMake(0, 0, view.frame.size.width, 120)
        datePicker.setDate(NSDate(), animated: false)
        
        let alertView = LGAlertView(viewAndTitle: nil, message: nil, style: LGAlertViewStyle.ActionSheet, view: datePicker, buttonTitles: ["확인"], cancelButtonTitle: "취소", destructiveButtonTitle: nil)
        alertView.actionHandler = { (alertView, title, index) in
            onSelected?(datePicker.date)
        }
        
        alertView?.showAnimated(true, completionHandler: nil)
        
    }
}
