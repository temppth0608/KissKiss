//
//  MainGraphViewController.swift
//  KissKiss
//
//  Created by 이설희 on 2016. 7. 25..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit

// MARK: - Property

class MainGraphViewController: UIViewController {
    
    @IBOutlet weak var dayContainerView: UIView!
    @IBOutlet weak var weekAndMonthContainerView: UIView!
    
}

// MARK: - IBAction

extension MainGraphViewController {
    @IBAction func showComponent(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animateWithDuration(0, animations: {
                self.dayContainerView.alpha = 1
                self.weekAndMonthContainerView.alpha = 0
            })
        } else {
            UIView.animateWithDuration(0, animations: {
                self.dayContainerView.alpha = 0
                self.weekAndMonthContainerView.alpha = 1
            })
        }
    }
}
