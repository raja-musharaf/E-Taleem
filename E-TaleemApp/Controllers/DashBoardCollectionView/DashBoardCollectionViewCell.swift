//
//  CollectionViewCell.swift
//  E-TaleemApp
//
//  Created by apple on 09/11/2021.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class DashBoardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var mainVC: UIView!
    @IBOutlet weak var txtVC: UIView!
    
    func configure(with v: viewOfPlatforms){
        lblName.text = v.vName
        imageView.image = v.vImage
    }
    
    override func layoutSubviews() {
        
        let itemSize = (self.frame.width)
        self.mainVC.frame = CGRect(x: 0, y: 0 , width: itemSize, height: itemSize )
        self.txtVC.frame = CGRect(x: 0, y: self.frame.height - 40 , width: self.frame.width, height: 40)
        self.mainVC.layer.cornerRadius = 15.0
        self.mainVC.layer.borderWidth = 5.0
        self.mainVC.layer.borderColor = UIColor.clear.cgColor
        self.mainVC.layer.masksToBounds = true
     //   self.txtVC.
        self.lblName.frame = CGRect(x: 0, y: 0 , width: self.txtVC.frame.width, height: self.txtVC.frame.height)
        let imgSize = self.frame.height / 2
        
        imageView.frame = CGRect(x: (self.frame.height / 4), y: 25, width: imgSize, height: imgSize)
        
    }
}
