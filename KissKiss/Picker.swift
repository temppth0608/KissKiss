//
//  Picker.swift
//  KissKiss
//
//  Created by snow on 2016. 8. 16..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit
import LGAlertView
import ActionSheetPicker_3_0

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


class KgPicker {
    static func show(view: UIView, dataSource: UIPickerViewDataSource, delegate: UIPickerViewDelegate  ,onSelected: ((String) -> Void)? = nil) {
        
        let pickerView = UIPickerView()
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.frame = CGRectMake(0, 0, view.frame.size.width, 120)
        //pickerView.set
        
        
        let alertView = LGAlertView(viewAndTitle: nil, message: nil, style: LGAlertViewStyle.ActionSheet, view: pickerView, buttonTitles: ["확인"], cancelButtonTitle: "취소", destructiveButtonTitle: nil)
        alertView.actionHandler = { (alertView, title, index) in
            onSelected?("")
        }
        
        alertView?.showAnimated(true, completionHandler: nil)
        
        
        //UIPickerViewDataSource, UIPickerViewDelegate
/*
         let pv = UIPickerView()
         let items = [[0,1,2,3,4,5,6,7,8,9], [0,1,2,3,4,5,6,7,8,9], [0,1,2,3,4,5,6,7,8,9], [0,1,2,3,4,5,6,7,8,9]]
         let alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
         let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:{
         (action: UIAlertAction!) -> Void in
         print("\(self.anime) \(self.chara)")
         })
         let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { action in
         }
         
         pv.selectRow(0, inComponent: 0, animated: true)
         pv.frame = CGRectMake(0, 0, view.frame.size.width, 120)
         //pv.dataSource = dataSource
         //pv.delegate = delegate
         alert.view.addSubview(pv)
         alert.
         
         alert.addAction(okAction)
         alert.addAction(cancelAction)
         alert.showAnimated(true, completionHandler: nil)
         
         */
        
        
        
        
        
    }
}
