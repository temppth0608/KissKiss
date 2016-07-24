//
//  DiaryCollectionViewController.swift
//  KissKiss
//
//  Created by 장섭 심 on 2016. 7. 24..
//  Copyright © 2016년 mashup. All rights reserved.
//


import UIKit

// MARK: - Property

class DiaryCollectionViewController: UIViewController {
    var datas = [KKDiary]()
}

// MARK: - Recycle Function

extension DiaryCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDiarayData()
    }

}

// MARK: - IBAction

extension DiaryCollectionViewController {
}

// MARK: - Private function

extension DiaryCollectionViewController {
    
    
}

// MARK: - public function

extension DiaryCollectionViewController {
    
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

extension DiaryCollectionViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DiaryCell", forIndexPath: indexPath) as! DiaryCollectionViewCell
        let diary = datas[indexPath.row]
        cell.dateLabel.text = diary.date.shortDate
        cell.diaryImageView.image = UIImage(named: diary.photoURL)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension DiaryCollectionViewController: UICollectionViewDelegate {
}

// 목업 데이터
class KKDiary {
    var date: NSDate = NSDate(timeIntervalSince1970: 1)
    var photoURL: String = ""
    var contents: String = ""
    
    init(photoURL: String, contents: String, date: NSDate) {
        self.photoURL = photoURL
        self.contents = contents
        self.date = date
    }
}







