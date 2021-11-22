//
//  ClassesTableViewCell.swift
//  E-TaleemApp
//
//  Created by apple on 11/11/2021.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ClassesTableViewCell: UITableViewCell {

    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var lblView1: UIView!
    @IBOutlet weak var lblTxt1: UILabel!
    
    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var lblView2: UIView!
    @IBOutlet weak var lblText2: UILabel!
    @IBOutlet weak var imgView2: UIImageView!
    
    @IBOutlet weak var lineVC: UIView!
    @IBOutlet weak var centerButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        
        lineVC.frame = CGRect(x: self.frame.width / 2, y: 0 , width: 5, height: self.frame.height )
        
        
        self.centerButton.frame = CGRect(x: -6 , y: self.frame.height / 2 - 4, width: centerButton.frame.width/2, height: centerButton.frame.width/2 )
        self.centerButton.layer.cornerRadius = centerButton.frame.width/2
        self.centerButton.clipsToBounds = true
        
        let itemSize = ((self.frame.width / 3) + 34)
        //for view 1
        self.View1.frame = CGRect(x: 0, y: 10 , width: itemSize, height: itemSize )
        
        self.lblView1.frame = CGRect(x: 0, y: View1.frame.height - 40 , width: View1.frame.width, height: 40)
        
        self.View1.layer.cornerRadius = 15.0
        self.View1.layer.borderWidth = 0.0
        // self.MainVC.layer.borderColor = colour.hexStringToUIColor(hex: colorArray[c]).cgColor
        self.View1.layer.masksToBounds = true
        //   self.txtVC.
        self.lblTxt1.frame = CGRect(x: 0, y: 0 , width: self.lblView1.frame.width, height: self.lblView1.frame.height)
        let imgSize = View1.frame.height / 2
        
        imgView1.frame = CGRect(x: (View1.frame.height / 5) + 10, y: (self.frame.height / 9), width: imgSize, height: imgSize)
        
        //for view 2
        self.View2.frame = CGRect(x: self.frame.width - itemSize + 5, y: 10 , width: itemSize, height: itemSize )
        
        self.lblView2.frame = CGRect(x: 0, y: View2.frame.height - 40 , width: View2.frame.width, height: 40)
        
        self.View2.layer.cornerRadius = 15.0
        self.View2.layer.borderWidth = 0.0
        // self.MainVC.layer.borderColor = colour.hexStringToUIColor(hex: colorArray[c]).cgColor
        self.View2.layer.masksToBounds = true
        //   self.txtVC.
        self.lblText2.frame = CGRect(x: 0, y: 0 , width: self.lblView2.frame.width, height: self.lblView2.frame.height)
        
        imgView2.frame = CGRect(x: (View1.frame.height / 5) + 10, y: (self.frame.height / 9), width: imgSize, height: imgSize)
    }
}
