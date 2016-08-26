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
    
    dynamic var uuid: String = ""
    dynamic var date: NSDate = NSDate(timeIntervalSince1970: 1)
    dynamic var photoData: NSData? = nil
    dynamic var contents: String? = nil
    
    override static func primaryKey()-> String? {
        return "uuid"
    }
}

class 다이어리_데이터_제공자 {
    private var 다이어리목록 = Results<Diary>?()
    private let realm = try! Realm()
    
    init() {
        다이어리목록 = realm.objects(Diary.self)
    }
    
    func 식별자(인덱스 인덱스: Int) -> String? {
        guard 인덱스 <= 다이어리목록?.count else {
            return nil
        }
        
        guard let 다이어리목록 = self.다이어리목록 else {
            return nil
        }
        
        return 다이어리목록[인덱스].uuid
    }
    
    func 다이어리목록_갯수() -> Int {
        return 다이어리목록?.count ?? 0
    }
    
    func 다이어리목록_가져오기() -> [Diary]? {
        if let 다이어리목록 = self.다이어리목록 {
            return 다이어리목록.toArray(Diary) as [Diary]
        }
        return nil
    }
    
    func 다이어리_가져오기(인덱스 인덱스: Int) -> Diary? {
        guard 인덱스 <= 다이어리목록?.count else {
            return nil
        }
        
        if let 다이어리목록 = self.다이어리목록 {
            let 목록 = 다이어리목록.toArray(Diary) as [Diary]
            return 목록[인덱스]
        }
        return nil
    }
    
    func 다이어리_추가하기(date: NSDate, photoData: NSData?, contents: String?) {
        let 식별값 = NSUUID().UUIDString
        let 다이어리 = Diary()
        다이어리.uuid = 식별값
        다이어리.date = date
        다이어리.photoData = photoData ?? nil
        다이어리.contents = contents ?? ""
        
        try! realm.write() {
            realm.add(다이어리)
        }
    }
    
    func 다이어리_수정하기(uuid: String, photoData: NSData?, contents: String?) {
        let 다이어리 = 다이어리_찾기(uuid)
        
        if let 다이어리 = 다이어리 {
            다이어리.photoData = photoData ?? nil
            다이어리.contents = contents ?? ""
            
            try! realm.write() {
                realm.add(다이어리)
            }
        }
    }
    
    func 다이어리_삭제(uuid: String) {
        let 다이어리 = 다이어리_찾기(uuid)
        
        if let 다이어리 = 다이어리 {
            try! realm.write {
                realm.delete(다이어리)
            }
        }
    }
    
    func 다이어리_전체삭제() {
        if let 다이어리목록 = self.다이어리목록 {
            try! realm.write {
                realm.delete(다이어리목록)
            }
        }
    }
    
    private func 다이어리_찾기(uuid: String) -> Diary? {
        return realm.objects(Diary.self).filter("uuid == \(uuid)").first ?? nil
    }
}
