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
    
//    @IBOutlet var webView: UIWebView!
//    var 변수: String

    @IBOutlet weak var dateButton: UIButton!
    
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
    
    @IBAction func onClickDateLabel(sender: AnyObject) {
        
        showDatePicker()
        
    }
    
    
    

    
}

// MARK: - Private function

extension DimensionCreateViewController {
    
    private func showDatePicker() {
        DatePicker.show(self.view) { selecedDate in
            self.dateButton.setTitle(DateFormat.strigFromDate(selecedDate), forState: .Normal)
        }
    }
}

// MARK: - public function

extension DimensionCreateViewController {

}

// MARK: - WKWebBiewDelegate

extension DimensionCreateViewController: UIWebViewDelegate {

}