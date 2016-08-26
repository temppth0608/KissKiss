//
//  다이어리_컬렉션_뷰컨트롤러.swift
//  KissKiss
//
//  Created by Naver on 2016. 8. 20..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit

// MARK: - Property
class 다이어리_컬렉션_뷰컨트롤러: UIViewController {
    @IBOutlet private weak var 컬렉션뷰: UICollectionView!
    
    let 다이어리데이터제공자 = 다이어리_데이터_제공자()
}

// MARK: - life cycle
extension 다이어리_컬렉션_뷰컨트롤러 {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        화면갱신()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "디테일" {
            let vc = segue.destinationViewController as! 다이어리_디테일_뷰컨트롤러
            if let 인덱스 = sender as? Int {
                vc.데이터 = 다이어리데이터제공자.다이어리_가져오기(인덱스: 인덱스)
            }
        }
    }
}

// MARK: - private function
extension 다이어리_컬렉션_뷰컨트롤러 {
    private func 화면갱신() {
        컬렉션뷰.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension 다이어리_컬렉션_뷰컨트롤러: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 다이어리데이터제공자.다이어리목록_갯수()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let 셀 = collectionView.dequeueReusableCellWithReuseIdentifier("컬렉션뷰셀", forIndexPath: indexPath) as! 다이어리_컬렉션_셀
        let 다이어리 = 다이어리데이터제공자.다이어리_가져오기(인덱스: indexPath.item)
        셀.다이어리정보 = 다이어리
        
        return 셀
    }
}

// MARK: - UICollectionViewDelegate
extension 다이어리_컬렉션_뷰컨트롤러: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("디테일", sender: indexPath.row)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension 다이어리_컬렉션_뷰컨트롤러: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let 뷰너비 = self.view.bounds.width
        
        return CGSizeMake(뷰너비 / 3 - 10, 122)
    }
}

// MARK: - UICollectionViewCell
class 다이어리_컬렉션_셀: UICollectionViewCell {
    @IBOutlet weak var 다이어리이미지뷰: UIImageView!
    @IBOutlet weak var 다이어리날짜: UILabel!
    
    var 다이어리정보: Diary? {
        didSet {
            화면갱신()
        }
    }
    
    private func 화면갱신() {
        if let 데이터 = self.다이어리정보 {
            if let 이미지데이터 = 데이터.photoData {
                다이어리이미지뷰.image = UIImage(data: 이미지데이터)
            }
            다이어리날짜.text = DateFormat.strigFromDate(데이터.date, 포멧: .다이어리날짜포멧)
        }
    }
}