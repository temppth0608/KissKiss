//
//  다이어리_디테일_뷰컨트롤러.swift
//  KissKiss
//
//  Created by Naver on 2016. 8. 20..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit
import LGAlertView

// MARK: - Property
class 다이어리_디테일_뷰컨트롤러: UIViewController {
    @IBOutlet weak var 다이어리날짜: UILabel!
    @IBOutlet weak var 다이어리이미지뷰: UIImageView!
    @IBOutlet weak var 다이어리내용: UILabel!
    
    let 다이어리데이터제공자 = 다이어리_데이터_제공자()
    var 데이터: Diary?
}

// MARK: - Recycle Function
extension 다이어리_디테일_뷰컨트롤러 {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        화면갱신()
    }
}

// MARK: - IBAction
extension 다이어리_디테일_뷰컨트롤러 {
    @IBAction func 더보기_버튼_탭(sender: UIButton) {
        let alertView = LGAlertView(title: "타이틀", message: "다이어리를 수정/삭제하시겠습니까?", style: LGAlertViewStyle.ActionSheet, buttonTitles: ["수정"], cancelButtonTitle: "취소", destructiveButtonTitle: "삭제")
        alertView.actionHandler = { (alertView, title, index) in
            // TODO: 수정
        }
        alertView.destructiveHandler = { _ in
            let uuid = self.데이터?.uuid
            
            if let uuid = uuid {
                self.다이어리데이터제공자.다이어리_삭제(uuid)
                self.navigationController?.popViewControllerAnimated(true)
            }
        }
        alertView.showAnimated(true, completionHandler: nil)
    }
}

// MARK: - Private function
extension 다이어리_디테일_뷰컨트롤러 {
    private func 화면갱신() {
        if let 데이터 = self.데이터 {
            다이어리날짜.text = DateFormat.strigFromDate(데이터.date, 포멧: .다이어리날짜포멧)
            if let 이미지데이터 = 데이터.photoData {
                다이어리이미지뷰.image = UIImage(data: 이미지데이터)
            }
            다이어리내용.text = 데이터.contents
        }
    }
}

