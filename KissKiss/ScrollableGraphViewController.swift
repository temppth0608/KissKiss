//
//  ScrollableGraphViewController.swift
//  KissKiss
//
//  Created by 이설희 on 2016. 7. 17..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit

class ScrollableGraphViewController: UIViewController {
    
    var graphView = ScrollableGraphView()
    var graphConstraints = [NSLayoutConstraint]()
    
    // Data
    let numberOfDataItems = 31
    
    lazy var data: [Double] = self.generateRandomData(self.numberOfDataItems, max: 50)
    
    //lazy var data: [Double] = [48,48,49,49, 50, 49, 48, 48, 48, 47, 47, 47, 47, 46, 48,48,49,49, 50, 49, 48, 48, 48, 47, 47, 47, 47, 46, 45, 45, 45]
    lazy var labels: [String] = self.generateSequentialLabels(self.numberOfDataItems, text: "7/")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        graphView = ScrollableGraphView(frame: self.view.frame)
        graphView = createDarkGraph(self.view.frame)
        
        graphView.setData(data, withLabels: labels)
        self.view.addSubview(graphView)
        
        setupConstraints()
        
    }
    
    private func createDarkGraph(frame: CGRect) -> ScrollableGraphView {
        let graphView = ScrollableGraphView(frame: frame)
        
        graphView.backgroundFillColor = UIColor.colorFromHex("#FFFFFF")
        
        graphView.lineWidth = 3
        graphView.lineColor = UIColor.colorFromHex("#E0487E")
        graphView.lineStyle = ScrollableGraphViewLineStyle.Straight
        
        graphView.shouldFill = false
//        graphView.fillType = ScrollableGraphViewFillType.Gradient
//        graphView.fillColor = UIColor.colorFromHex("#555555")
//        graphView.fillGradientType = ScrollableGraphViewGradientType.Radial
//        graphView.fillGradientStartColor = UIColor.colorFromHex("#E0487E")
//        graphView.fillGradientEndColor = UIColor.colorFromHex("#E0487E")
        
        graphView.dataPointSpacing = 80
        graphView.dataPointSize = 2
        //graphView.dataPointFillColor = UIColor.blackColor()
        graphView.dataPointFillColor = UIColor.colorFromHex("#E0487E")
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFontOfSize(8)
        //graphView.referenceLineColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
        //graphView.referenceLineLabelColor = UIColor.whiteColor()
        graphView.referenceLineLabelColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        graphView.referenceLineColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        graphView.numberOfIntermediateReferenceLines = 5
        graphView.dataPointLabelColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        
        graphView.shouldAnimateOnStartup = true
        graphView.shouldAdaptRange = true
        graphView.adaptAnimationType = ScrollableGraphViewAnimationType.Elastic
        graphView.animationDuration = 1.5
        graphView.rangeMax = 50
        graphView.shouldRangeAlwaysStartAtZero = true
        
        return graphView
    }
    
    private func setupConstraints() {
        
        self.graphView.translatesAutoresizingMaskIntoConstraints = false
        graphConstraints.removeAll()
        
        let topConstraint = NSLayoutConstraint(item: self.graphView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: self.graphView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        let BottomConstraint = NSLayoutConstraint(item: self.graphView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: self.graphView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        
        
        graphConstraints.append(topConstraint)
        graphConstraints.append(BottomConstraint)
        graphConstraints.append(leftConstraint)
        graphConstraints.append(rightConstraint)
        
        self.view.addConstraints(graphConstraints)
    }
    
    
    // Data Generation
    private func generateRandomData(numberOfItems: Int, max: Double) -> [Double] {
        var data = [Double]()
        for _ in 0 ..< numberOfItems {
            var randomNumber = Double(random()) % max
            
            if(random() % 100 < 10) {
                randomNumber *= 3
            }
            
            data.append(randomNumber)
        }
        return data
    }
    
    private func generateSequentialLabels(numberOfItems: Int, text: String) -> [String] {
        var labels = [String]()
        for i in 0 ..< numberOfItems {
            labels.append("\(text) \(i+1)")
        }
        return labels
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    

}
