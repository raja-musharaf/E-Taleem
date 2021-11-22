//
//  TeleschoolCollectionViewCell.swift
//  E-TaleemApp
//
//  Created by apple on 10/11/2021.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
class TeleschoolCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var MainVC: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var txtVC: UIView!
  //
    var b = 0
    let colour = UIColor()
   // var colorArray : [String] =  ["#2091D0","#40B760" ,"#F15C31","#F9A14B" ,"#CD3334" , "#005EAA" ,"#F89939" , "#A53CC6"]
    func configure(with t: teleSchoolView){
        //a = color
      //  MainVC.layer.backgroundColor = colour.hexStringToUIColor(hex: color).cgColor
        lblName.text = "Class"
        imageView.image = t.classImage
    }
    
    override func layoutSubviews() {
 //       print("\(colorArray[c])")
//        print("\((colorArray.count) - (colorArray.count-1))")
//        print(colorArray[(colorArray.count) - (colorArray.count-1)])
       // self.lblName.textColor = colour.hexStringToUIColor(hex: colorArray[c])
        let itemSize = (self.frame.width)
        self.MainVC.frame = CGRect(x: 0, y: 0 , width: itemSize, height: itemSize )
        self.txtVC.frame = CGRect(x: 0, y: self.frame.height - 55 , width: self.frame.width, height: 40)
        self.MainVC.layer.cornerRadius = 15.0
        self.MainVC.layer.borderWidth = 5.0
       // self.MainVC.layer.borderColor = colour.hexStringToUIColor(hex: colorArray[c]).cgColor
        self.MainVC.layer.masksToBounds = true
        //   self.txtVC.
        self.lblName.frame = CGRect(x: 0, y: 0 , width: self.txtVC.frame.width, height: self.txtVC.frame.height)
        let imgSize = self.frame.height / 2
        
        imageView.frame = CGRect(x: (self.frame.height / 4), y: 25, width: imgSize, height: imgSize)
    }
}
