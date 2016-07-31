//
//  DiaryCollectionViewController.swift
//  KissKiss
//
//  Created by 장섭 심 on 2016. 7. 24..
//  Copyright © 2016년 mashup. All rights reserved.
//


import UIKit

// MARK: - Property

class TLDiaryCollectionViewController: UIViewController {
    var datas = [KKDiary]()

}

// MARK: - Recycle Function

extension TLDiaryCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDiarayData()

    }
    
}

// MARK: - IBAction

extension TLDiaryCollectionViewController {
}

// MARK: - Private function

extension TLDiaryCollectionViewController {
    
    
}

// MARK: - public function

extension TLDiaryCollectionViewController {
    func setUpDiarayData() {
        let tempDiary0 = KKDiary(photoURL: "qwe", contents: "qweqwewqewqe", date: NSDate())
        let tempDiary1 = KKDiary(photoURL: "qwe", contents: "qweqwewqewqe", date: NSDate())
        let tempDiary2 = KKDiary(photoURL: "qwe", contents: "qweqwewqewqe", date: NSDate())
        let tempDiary3 = KKDiary(photoURL: "qwe", contents: "qweqwewqewqe", date: NSDate())
        let tempDiary4 = KKDiary(photoURL: "qwe", contents: "qweqwewqewqe", date: NSDate())
        datas.append(tempDiary0)
        datas.append(tempDiary1)
        datas.append(tempDiary2)
        datas.append(tempDiary3)
        datas.append(tempDiary4)
    }

}

// MARK: - UICollectionViewDataSource

extension TLDiaryCollectionViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TLDiaryCell", forIndexPath: indexPath) as! TLDiaryCollectionViewCell
        let diary = datas[indexPath.row]
        cell.TLDateLabel.text = diary.date.shortDate
        cell.TLImageView.image = UIImage(named: diary.photoURL)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension TLDiaryCollectionViewController: UICollectionViewDelegate {
}








