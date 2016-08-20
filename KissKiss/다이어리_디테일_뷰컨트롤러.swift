//
//  다이어리_디테일_뷰컨트롤러.swift
//  KissKiss
//
//  Created by Naver on 2016. 8. 20..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit

// MARK: - Property
class 다이어리_디테일_뷰컨트롤러: UIViewController {
    @IBOutlet weak var 다이어리날짜: UILabel!
    @IBOutlet weak var 다이어리이미지뷰: UIImageView!
    @IBOutlet weak var 다이어리내용: UILabel!
    
    var 데이터: 다이어리?
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
        
    }
}

// MARK: - Private function
extension 다이어리_디테일_뷰컨트롤러 {
    private func 화면갱신() {
        if let 데이터 = self.데이터 {
            다이어리날짜.text = DateFormat.strigFromDate(데이터.date, 포멧: .다이어리날짜포멧)
            //TODO: 변경필요
            다이어리이미지뷰.image = UIImage(named: "btn_camera")
            다이어리내용.text = 데이터.contents
        }
    }
}

