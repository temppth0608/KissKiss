//
//  RealmExtension.swift
//  KissKiss
//
//  Created by Naver on 2016. 8. 21..
//  Copyright © 2016년 mashup. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}