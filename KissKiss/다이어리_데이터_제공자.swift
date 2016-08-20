//
//  다이어리_데이터_제공자.swift
//  KissKiss
//
//  Created by Naver on 2016. 8. 20..
//  Copyright © 2016년 mashup. All rights reserved.
//

import Foundation

// TODO: 임시 목 클래스
class 다이어리: NSObject {
    var uuid: Int = 0
    var date: NSDate = NSDate(timeIntervalSince1970: 1)
    var photoURL: String = ""
    var contents: String = ""
    
    init(uuid: Int, photoURL: String, contents: String) {
        self.uuid = uuid
        self.photoURL = photoURL
        self.contents = contents
    }
}


class 다이어리_데이터_제공자 {
    var 다이어리목록 = [다이어리]()
    
    // TODO: 임시데이터 생성 (추후 realm데이터로 변경)
    init() {
        Array(0...12).forEach {
            다이어리목록.append(다이어리(uuid: $0, photoURL: "", contents: "테스트 입니다."))
        }
    }
}