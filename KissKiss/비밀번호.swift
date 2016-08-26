//
//  비밀번호.swift
//  KissKiss
//
//  Created by Naver on 2016. 8. 27..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit

class 비밀번호_뷰컨트롤러: UIViewController {
    
    @IBOutlet weak var 첫번째암호뷰: UIView!
    @IBOutlet weak var 두번째암호뷰: UIView!
    @IBOutlet weak var 세번째암호뷰: UIView!
    @IBOutlet weak var 네번째암호뷰: UIView!
    
    var 비밀번호: [String] = [] {
        didSet {
            암호뷰상태변경()
            if 비밀번호.count == 4 {
                비밀번호검사()
            }
        }
    }
    
    let 임시비밀번호 = "8520"
}

extension 비밀번호_뷰컨트롤러 {
    override func viewDidLoad() {
        초기화()
    }
}

extension 비밀번호_뷰컨트롤러 {
    @IBAction func 번호_탭(sender: UIButton) {
        let 번호 = sender.tag
        if 비밀번호.count <= 3 {
            비밀번호.append("\(번호)")
        }
    }
    
    @IBAction func 지우기_탭(sender: UIButton) {
        if 비밀번호.count >= 1 {
            비밀번호.removeLast()
        }
    }
}

extension 비밀번호_뷰컨트롤러 {
    private func 초기화() {
        비밀번호 = []
        
        첫번째암호뷰.hidden = true
        두번째암호뷰.hidden = true
        세번째암호뷰.hidden = true
        네번째암호뷰.hidden = true
    }
    
    private func 암호뷰상태변경() {
        switch 비밀번호.count {
        case 0:
            첫번째암호뷰.hidden = true
            두번째암호뷰.hidden = true
            세번째암호뷰.hidden = true
            네번째암호뷰.hidden = true
        case 1:
            첫번째암호뷰.hidden = false
            두번째암호뷰.hidden = true
            세번째암호뷰.hidden = true
            네번째암호뷰.hidden = true
        case 2:
            첫번째암호뷰.hidden = false
            두번째암호뷰.hidden = false
            세번째암호뷰.hidden = true
            네번째암호뷰.hidden = true
        case 3:
            첫번째암호뷰.hidden = false
            두번째암호뷰.hidden = false
            세번째암호뷰.hidden = false
            네번째암호뷰.hidden = true
        default:
            첫번째암호뷰.hidden = false
            두번째암호뷰.hidden = false
            세번째암호뷰.hidden = false
            네번째암호뷰.hidden = false
        }
    }
    
    private func 비밀번호검사() {
        let 입력된비밀번호 = 비밀번호.reduce("") { $0 + $1 }
        
        if 입력된비밀번호 == 임시비밀번호 {
            let 루트탭뷰컨트롤러 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("루트")
            UIApplication.sharedApplication().keyWindow?.rootViewController = 루트탭뷰컨트롤러
        } else {
            let alertController = UIAlertController(title: "경고", message: "비밀번호가 일치하지 않습니다.", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "확인", style: .Cancel) { _ in
                self.초기화()
            }
            
            alertController.addAction(alertAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
}