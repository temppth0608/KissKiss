//
//  DimensionCreateViewController.swift
//  KissKiss
//
//  Created by snow on 2016. 8. 15..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit

// MARK: - Property

class DimensionCreateViewController: UIViewController {
    
    @IBOutlet weak var date: UIButton!
    @IBOutlet weak var weight: UIButton!
    @IBOutlet weak var waist: UIButton!
    @IBOutlet weak var arm: UIButton!
    @IBOutlet weak var leg: UIButton!
    
}

// MARK: - Recycle Function

extension DimensionCreateViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date.setTitle(DateFormat.strigFromDate(NSDate(), 포멧: .피커포멧), forState: .Normal)
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
    
    @IBAction func onClickDate(sender: UIButton) {
        showDatePicker(of: sender)
    }
    
    @IBAction func onClickDimension(sender: UIButton) {
        showDimensionPicker(of: sender)
    }
    
    @IBAction func onClickSave(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}

// MARK: - Private function

extension DimensionCreateViewController {
    
    private func showDatePicker(of sender: UIButton) {
        Picker.Date.show(self.view) { selecedDate in
            sender.setTitle(DateFormat.strigFromDate(selecedDate, 포멧: .피커포멧), forState: .Normal)
        }
    }
    
    private func showDimensionPicker(of sender: UIButton) {
        guard let senderIdentifier = sender.restorationIdentifier else {
            return
        }
        
        Picker.Dimension.show(view, senderIdentifier: senderIdentifier) { selectedDimension in
            if let selectedDimension = selectedDimension {
                sender.setTitle(selectedDimension, forState: .Normal)
            }
        }
    }

}

// MARK: - public function

extension DimensionCreateViewController {

}

extension DimensionCreateViewController {
    
}