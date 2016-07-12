//
//  Dimension.swift
//  KissKiss
//
//  Created by 이설희 on 2016. 7. 12..
//  Copyright © 2016년 mashup. All rights reserved.
//

import Foundation
import RealmSwift

class Dimension: Object {
    
    dynamic var date :NSDate = NSDate(timeIntervalSince1970: 1)
    dynamic var weight: Double = 0
    dynamic var waist: Double = 0
    dynamic var arm: Double = 0
    dynamic var leg: Double = 0
    dynamic var BMI: Double = 0
    
    override static func primaryKey()-> String? {
        return "date"
    }

}
 