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
        static func show(view: UIView, selectedRow: Int? = nil, onSelected: ((String?) -> Void)? = nil) {
            let pickerView = SectionPickerView(frame: CGRectMake(0, 0, view.frame.size.width, 120))
            if let row = selectedRow {
                pickerView.selectRow(row, inComponent: 0, animated: false)
            }
            
            let alertView = LGAlertView(viewAndTitle: "", message: "", style: LGAlertViewStyle.ActionSheet, view: pickerView, buttonTitles: ["확인"], cancelButtonTitle: "취소", destructiveButtonTitle: nil)
            alertView.actionHandler = { (alertView, title, index) in
                let seledted = pickerView.sectionPickerList[pickerView.selectedRowInComponent(0)]
                
                onSelected?(seledted)
            }
            alertView?.cancelButtonFont = alertView?.buttonsFont
            alertView?.showAnimated(true, completionHandler: nil)
        }
        
        
        class SectionPickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
            let sectionPickerList = ["몸무게 그래프","허리 그래프","다리 그래프", "팔 그래프"]
            
            override init(frame: CGRect) {
                super.init(frame: frame)
                self.delegate = self
                self.dataSource = self
            }
            
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
            
            func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
                return 1
            }
            
            func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
                return sectionPickerList.count
            }
            
            func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                return sectionPickerList[row]
            }
        }

        
    
    }
    
    class Dimension {
        static func show(view: UIView, selectedRow: Int? = nil, senderIdentifier: String, onSelected: ((String?) -> Void)? = nil) {
            let pickerView = DimensionPickerView(frame: CGRectMake(0, 0, view.frame.size.width * 0.6, 120))
            if let row = selectedRow {
                pickerView.selectRow(row, inComponent: 0, animated: false)
            }
            
            let alertView = LGAlertView(viewAndTitle: "", message: "", style: LGAlertViewStyle.ActionSheet, view: pickerView, buttonTitles: ["확인"], cancelButtonTitle: "취소", destructiveButtonTitle: nil)
            
            alertView.actionHandler = { (alertView, title, index) in
                let selectedDimension = [pickerView.selectedRowInComponent(0), pickerView.selectedRowInComponent(1), pickerView.selectedRowInComponent(2), pickerView.selectedRowInComponent(3), pickerView.selectedRowInComponent(4)]
                
                onSelected?("\(self.getDimension(selectedDimension))\(getUnit(of: senderIdentifier))")
            }
            
            alertView?.cancelButtonFont = alertView?.buttonsFont
            alertView?.showAnimated(true, completionHandler: nil)
        }
        
        private static func getDimension(selectedList: [Int]) -> String {
            return "\(selectedList[0])\(selectedList[1])\(selectedList[2]) . \(selectedList[3])\(selectedList[4]) "
        }
        
        private static func getUnit(of senderId: String) -> String{
            return senderId == "weight" ? "KG" : "CM"
        }
        
        
        class DimensionPickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
            var DimensionDataSource = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
            
            override init(frame: CGRect) {
                super.init(frame: frame)
                self.delegate = self
                self.dataSource = self
                
                let height = CGFloat(20)
                let offsetY = self.frame.size.height / 2 - height / 2
                let width = self.frame.size.width / 2
                
                let dotLabel = UILabel(frame: CGRectMake(width * 0.755, offsetY, width, height))
                dotLabel.textAlignment = .Center
                dotLabel.text = "."
                self.addSubview(dotLabel)
                
            }
            
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
            
            func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
                return 5
            }
            
            func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
                return DimensionDataSource.count
            }
            
            func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                return DimensionDataSource[row]
            }
        }

        
    }
    
}




