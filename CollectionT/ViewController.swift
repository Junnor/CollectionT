//
//  ViewController.swift
//  CollectionT
//
//  Created by InReading on 16/5/27.
//  Copyright © 2016年 InReading. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private struct Constant {
        static let UpperID = "UpperID"
        static let LowerID = "LowerID"
    }
    @IBOutlet weak var upperCollectionView: UICollectionView!
    @IBOutlet weak var lowerCollectionView: UICollectionView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    private let gap: CGFloat = 10
    
    private var upperSectionInsets:UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: gap, bottom: 0, right: gap)
    }
    private var lowerSectionInsets:UIEdgeInsets {
        return UIEdgeInsets(top: gap, left: gap, bottom: gap, right: gap)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.grayColor()
        self.automaticallyAdjustsScrollViewInsets = false;
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upperCollectionView {
            return 7
        } else {
            return 14
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView == upperCollectionView {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constant.UpperID, forIndexPath: indexPath) as! ScrollCell
            cell.imageView.image = UIImage(named: "img")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constant.LowerID, forIndexPath: indexPath) as! LowerCell
            cell.imageView.image = UIImage(named: "img")
            return cell
        }
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if collectionView == upperCollectionView {
            titleLabel.text = "   \(indexPath.section) - \(indexPath.row)"
        } else {
            let cell = collectionView.cellForItemAtIndexPath(indexPath) as! LowerCell
            cell.selected = true
            print("Selected indexPath (\(indexPath.section) - \(indexPath.row))")
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let width = view.bounds.size.width

        if collectionView == upperCollectionView {
            let cellWidth = (width - gap * 3) * 2 / 5
            let cellHeight = cellWidth * 4 / 7

            return CGSize(width: cellWidth, height: cellHeight)
        } else {
            let cellWidth = (width - gap * 3) / 2
            let cellHeight = cellWidth * 11 / 9
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return collectionView == upperCollectionView ? upperSectionInsets : lowerSectionInsets
    }
}

