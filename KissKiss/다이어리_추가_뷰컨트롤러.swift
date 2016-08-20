//
//  다이어리_추가_뷰컨트롤러.swift
//  KissKiss
//
//  Created by Naver on 2016. 8. 20..
//  Copyright © 2016년 mashup. All rights reserved.
//

import UIKit

enum 셀_스타일 {
    case 사진셀
    case 날짜셀
    case 내용셀
    
    var 셀식별자: String {
        switch self {
        case 사진셀:
            return "사진셀"
        case 날짜셀:
            return "날짜셀"
        case 내용셀:
            return "내용셀"
        }
    }
}

// MARK: - Property
class 다이어리_추가_뷰컨트롤러: UIViewController, UINavigationControllerDelegate {
    @IBOutlet private weak var 테이블뷰: UITableView!
    
    var 다이어리이미지: UIImage? {
        didSet {
            테이블뷰.reloadData()
        }
    }
    
    let 셀목록 :[셀_스타일] = [.사진셀, .날짜셀, .내용셀]
}

// MARK: - Life Cycle function
extension 다이어리_추가_뷰컨트롤러 {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        테이블뷰.reloadData()
    }
}

// MARK: - Private function
extension 다이어리_추가_뷰컨트롤러 {
    private func 포토라이브러리띄우기() {
        let 이미지피커 = UIImagePickerController()
        이미지피커.sourceType = .PhotoLibrary
        이미지피커.allowsEditing = true
        이미지피커.delegate = self
        
        presentViewController(이미지피커, animated: true, completion: nil)
    }
    
    private func 화면애니메이션(올라감: Bool, 완료됨: (Void -> Void)?) {
        // TODO: 상수 변수로 변경
        let 움질일높이: CGFloat = 371.0
        let 뷰높이 = self.view.frame.origin.y
        UIView.animateWithDuration(0.3) {
            self.view.frame.origin.y = 올라감 ? 뷰높이 - 움질일높이 : 뷰높이 + 움질일높이
        }
    }
}

// MARK: - IBAction
extension 다이어리_추가_뷰컨트롤러 {
    @IBAction func 취소_버튼_탭(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func 저장_버튼_탭(sender: UIButton) {
        print(#function)
    }
}

// MARK: - UITableViewDataSource
extension 다이어리_추가_뷰컨트롤러: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 셀목록.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let 셀스타일 = 셀목록[indexPath.row]
        
        switch 셀스타일 {
        case .사진셀:
            let 셀 = tableView.dequeueReusableCellWithIdentifier(셀스타일.셀식별자, forIndexPath: indexPath) as! 사진셀
            if let 다이어리이미지 = self.다이어리이미지 {
                셀.다이어리이미지뷰.image = 다이어리이미지
            }
            return 셀
        case .날짜셀:
            let 셀 = tableView.dequeueReusableCellWithIdentifier(셀스타일.셀식별자, forIndexPath: indexPath) as! 날짜셀
            return 셀
        case .내용셀:
            let 셀 = tableView.dequeueReusableCellWithIdentifier(셀스타일.셀식별자, forIndexPath: indexPath) as! 내용셀
            return 셀
        }
    }
}

extension 다이어리_추가_뷰컨트롤러: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let 셀스타일 = 셀목록[indexPath.row]
        
        switch 셀스타일 {
        case .사진셀:
            return 371
        case .날짜셀:
            return 56
        case .내용셀:
            return 126
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let 셀스타일 = 셀목록[indexPath.row]
        
        switch 셀스타일 {
        case .사진셀:
            포토라이브러리띄우기()
        case .날짜셀:
            print("날짜셀 클릭")
        case .내용셀:
            print("내용셀 클릭")
        }
    }
}

extension 다이어리_추가_뷰컨트롤러: UIImagePickerControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let 이미지 = info[UIImagePickerControllerEditedImage] as! UIImage
        
        다이어리이미지 = 이미지
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension 다이어리_추가_뷰컨트롤러: UITextViewDelegate {
    func textViewDidBeginEditing(textView: UITextView) {
        화면애니메이션(true, 완료됨: nil)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        화면애니메이션(false, 완료됨: nil)
        resignFirstResponder()
    }
}

class 사진셀: UITableViewCell {
    @IBOutlet weak var 다이어리이미지뷰: UIImageView!
}

class 날짜셀: UITableViewCell {
    @IBOutlet weak var 오늘날짜: UILabel!
}

class 내용셀: UITableViewCell {
    @IBOutlet weak var 다이어리내용: UITextView!
}