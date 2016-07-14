//
//  Diary.swift
//  KissKiss
//
//  Created by 이설희 on 2016. 7. 13..
//  Copyright © 2016년 mashup. All rights reserved.
//

import Foundation
import RealmSwift

class Diary: Object {
    
    dynamic var uuid: Int = 0
    dynamic var date: NSDate = NSDate(timeIntervalSince1970: 1)
    dynamic var photoURL: String = ""
    dynamic var contents: String = ""
    
    override static func primaryKey()-> String? {
        return "uuid"
    }
    
}
