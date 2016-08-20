//
//  다이어리_테이블_뷰컨트롤러.swift
//  KissKiss
//
//  Created by Naver on 2016. 8. 20..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit

// MARK: - Property
class 다이어리_테이블_뷰컨트롤러: UIViewController {
    let 다이어리데이터제공자 = 다이어리_데이터_제공자()
}

// MARK: - UITableViewDataSource
extension 다이어리_테이블_뷰컨트롤러: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 다이어리데이터제공자.다이어리목록.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let 셀 = tableView.dequeueReusableCellWithIdentifier("테이블셀", forIndexPath: indexPath) as! 다이어리_테이블_셀
        let 다이어리 = 다이어리데이터제공자.다이어리목록[indexPath.item]
        셀.다이어리정보 = 다이어리
        
        return 셀
    }
}

extension 다이어리_테이블_뷰컨트롤러: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 450.0
    }
}


// MARK: - UITableViewCell
class 다이어리_테이블_셀: UITableViewCell {
    @IBOutlet private weak var 다이어리날짜: UILabel!
    @IBOutlet private weak var 더보기버튼: UIButton!
    @IBOutlet private weak var 다이어리이미지뷰: UIImageView!
    @IBOutlet private weak var 다이어리내용: UILabel!
    
    var 다이어리정보: 다이어리? {
        didSet {
            화면갱신()
        }
    }
    
    private func 화면갱신() {
        if let 데이터 = self.다이어리정보 {
            다이어리날짜.text = DateFormat.strigFromDate(데이터.date, 포멧: .다이어리날짜포멧)
            //TODO: 변경필요
            다이어리이미지뷰.image = UIImage(named: "btn_camera")
            다이어리내용.text = 데이터.contents
        }
    }
}