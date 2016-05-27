//
//  LowerCell.swift
//  CollectionT
//
//  Created by InReading on 16/5/27.
//  Copyright © 2016年 InReading. All rights reserved.
//

import UIKit

class LowerCell: UICollectionViewCell {
    
    override var selected: Bool {
        didSet {
            checkImageView.image = selected ? UIImage(named: "brown") :  UIImage(named: "green")
            setNeedsDisplay()
        }
    }
    
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
}
