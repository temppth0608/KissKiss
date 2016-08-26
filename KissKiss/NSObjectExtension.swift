//
//  NSObjectExtension.swift
//  KissKiss
//
//  Created by Naver on 2016. 8. 27..
//  Copyright © 2016년 mashup. All rights reserved.
//

import Foundation

private var 인덱스패스키: UInt8 = 0
extension NSObject {
    func 인덱스패스저장(인덱스패스: NSIndexPath) {
        objc_setAssociatedObject(self, &인덱스패스키, 인덱스패스, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func 인덱스패스() -> NSIndexPath? {
        let indexPath = objc_getAssociatedObject(self, &인덱스패스키)
        return indexPath as? NSIndexPath
    }
}