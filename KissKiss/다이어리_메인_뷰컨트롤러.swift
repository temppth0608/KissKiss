//
//  다이어리_메인_뷰컨트롤러.swift
//  KissKiss
//
//  Created by Naver on 2016. 8. 20..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit

// MARK: - Property
class 다이어리_메인_뷰컨트롤러: UIViewController {
    @IBOutlet private weak var 컬렉션컨테이너뷰: UIView!
    @IBOutlet private weak var 테이블컨테이너뷰: UIView!
    
    var 컬렉션형식선택됨: Bool = true {
        didSet {
            화면갱신()
        }
    }
}

// MARK: - Recycle Function
extension 다이어리_메인_뷰컨트롤러 {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        화면갱신()
    }
}

// MARK: - IBAction
extension 다이어리_메인_뷰컨트롤러 {
    @IBAction func 컬렉션_형식_버튼_탭(sender: UIButton) {
        컬렉션형식선택됨 = true
    }
    
    @IBAction func 테이블_형식_버튼_탭(sender: UIButton) {
        컬렉션형식선택됨 = false
    }
}

// MARK: - Private function
extension 다이어리_메인_뷰컨트롤러 {
    private func 화면갱신() {
        if 컬렉션형식선택됨 {
            컬렉션컨테이너뷰.hidden = false
            테이블컨테이너뷰.hidden = true
        } else {
            컬렉션컨테이너뷰.hidden = true
            테이블컨테이너뷰.hidden = false
        }
    }
}