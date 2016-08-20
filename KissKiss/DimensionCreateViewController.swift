//
//  DimensionCreateViewController.swift
//  KissKiss
//
//  Created by snow on 2016. 8. 15..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit

// MARK: - Property

class DimensionCreateViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var dateButton: UIButton!
    
    @IBOutlet weak var weightButton: UIButton!
    
    var pickerDataSource = ["White", "Red", "Green", "Blue"];
    
  
}

// MARK: - Recycle Function

extension DimensionCreateViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



// MARK: - IBAction

extension DimensionCreateViewController {
    
    @IBAction func onClickCloseButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onClickDate(sender: AnyObject) {
        showDatePicker()
    }
    
    @IBAction func onClickWeight(sender: AnyObject) {
        showKgPicker()
    }
    
    
    
    

    
}

// MARK: - Private function

extension DimensionCreateViewController {
    
    private func showDatePicker() {
        DatePicker.show(self.view) { selecedDate in
            self.dateButton.setTitle(DateFormat.strigFromDate(selecedDate, 포멧: .피커포멧), forState: .Normal)
        }
    }
    
    private func showKgPicker() {
//        KgPicker.show(self.view) { currentKg in
//            self.dateButton.setTitle(currentKg)
//        }
        

        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return pickerDataSource[row]
    }
}

// MARK: - public function

extension DimensionCreateViewController {

}

// MARK: - WKWebBiewDelegate

extension DimensionCreateViewController: UIWebViewDelegate {

}