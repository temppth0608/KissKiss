//
//  MainGraphViewController.swift
//  KissKiss
//
//  Created by 이설희 on 2016. 7. 25..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit

// MARK: - Property

class MainGraphViewController: UIViewController{
    

    @IBOutlet weak var TwoViewContainer: UIView!
    @IBOutlet weak var ThreeViewContainer: UIView!
    
    @IBOutlet weak var SectionButton: UIButton!
    
}

// MARK: - IBAction

extension MainGraphViewController {
    
    @IBAction func onClickSection(sender: UIButton) {
        showSectionPicker()
    }
    
    @IBAction func showComponent(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animateWithDuration(0, animations: {
                self.TwoViewContainer.alpha = 1
                self.ThreeViewContainer.alpha = 0
            })
        } else {
            UIView.animateWithDuration(0, animations: {
                self.TwoViewContainer.alpha = 0
                self.ThreeViewContainer.alpha = 1
            })
        }
    }
}


extension MainGraphViewController {
    
    private func showSectionPicker() {
        Picker.List.show(view) { selected in
            if let selected = selected {
                self.SectionButton.setTitle(selected, forState: .Normal)
            }
        }
    }
}
