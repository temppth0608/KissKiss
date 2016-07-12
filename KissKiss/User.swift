//
//  User.swift
//  KissKiss
//
//  Created by 이설희 on 2016. 7. 13..
//  Copyright © 2016년 mashup. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    static var instance: User!
    dynamic var uuid: Int64 = 0
    dynamic var gender: String = ""
    dynamic var age : Int = 0
    dynamic var height: Int = 0
    
    class func sharedInstance() -> User {
        self.instance = (self.instance ?? User())
        return self.instance
    }
    
    override static func primaryKey()-> String? {
        return "uuid"
    }

}
