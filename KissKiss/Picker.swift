//
//  Picker.swift
//  KissKiss
//
//  Created by snow on 2016. 8. 16..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit
import LGAlertView


class Picker {
    
    class Date {
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
    
    
    class List {
        static func show(view: UIView, dataSource: UIPickerViewDataSource, delegate: UIPickerViewDelegate, selectedRow: Int? = nil, onSelected: ((Int?) -> Void)? = nil) {
            let pickerView = UIPickerView(frame: CGRectMake(0, 0, view.frame.size.width, 120))
            pickerView.dataSource = dataSource
            pickerView.delegate = delegate
            if let row = selectedRow {
                pickerView.selectRow(row, inComponent: 0, animated: false)
            }
            
            let alertView = LGAlertView(viewAndTitle: "", message: "", style: LGAlertViewStyle.ActionSheet, view: pickerView, buttonTitles: ["확인"], cancelButtonTitle: "취소", destructiveButtonTitle: nil)
            alertView.actionHandler = { (alertView, title, index) in
                onSelected?(pickerView.selectedRowInComponent(0))
            }
            
            alertView?.cancelButtonFont = alertView?.buttonsFont
            alertView?.showAnimated(true, completionHandler: nil)
        }
    
    }
    
    class Kg {
        
    }
    
    
    
}




