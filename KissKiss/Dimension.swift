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
    
    // MARK: - Table / Property Names
    
    static let tableName = "Dimension"
    
    static let uuid = "uuid"
    static let date = "date"
    static let weight = "weight"
    static let waist = "waist"
    static let arm = "arm"
    static let leg = "leg"
    static let bmi = "bmi"
    
    // MARK: - Common Properties
    
    dynamic var uuid: Int = 0
    dynamic var date :NSDate = NSDate(timeIntervalSince1970: 1)
    dynamic var weight: Double = 0
    dynamic var waist: Double = 0
    dynamic var arm: Double = 0
    dynamic var leg: Double = 0
    dynamic var bmi: Double = 0
    
    // MARK: - Primary Key
    
    override static func primaryKey()-> String? {
        return "uuid"
    }
    
}

class DimensionRealmService {
    private let realm = try! Realm()
//    private var
}
 