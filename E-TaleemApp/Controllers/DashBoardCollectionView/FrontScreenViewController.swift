//
//  ViewController.swift
//  E-TaleemApp
//
//  Created by apple on 09/11/2021.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import JJFloatingActionButton
class FrontScreenViewController: UIViewController {

    //MARK :- Outlets
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet var fulView: UIView!
    @IBOutlet weak var topVC: UIView!
    @IBOutlet weak var platformVC: UICollectionView!
    @IBOutlet weak var imgMoft: UIImageView!
    @IBOutlet weak var imgLogo: UIImageView!
    
    //MARK :- Variables
    fileprivate let actionButton = JJFloatingActionButton()
    var collectionViews : [viewOfPlatforms] = []
    var nextUI : [String] =  ["TeleschoolViewController","RadioSchoolViewController","DigitalPlatformViewController","AccleratedViewController","InclusiveLearningViewController"]
    var colorCV : [String] = ["#FB4D02" , "#2DB336" , "#3B68BC" , "#FFC300" , "#A53CC6"]
    var colorTxtCV : [String] = ["#c24711" , "#2e9435" , "#375da3" , "#c29a17" , "#8c3ca6"]
    let color = UIColor()
    
    //MARK :- Override didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //rounded cornor of topView
        self.topVC.layer.mask = function.shared.topViewRoundCorner(bounds: self.topVC.bounds)
        //transparent Navigation Bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        collectionViews.append(viewOfPlatforms(vName: "Teleschool", vImage: UIImage(named: "ic_teleschool")))
        collectionViews.append(viewOfPlatforms(vName: "Radio School", vImage: UIImage(named: "ic-radioschool")))
        collectionViews.append(viewOfPlatforms(vName: "Digital Platforms", vImage: UIImage(named: "ic_digital_platforms")))
        collectionViews.append(viewOfPlatforms(vName: "Acclerated Learning", vImage: UIImage(named: "ic_accelerated_learning")))
        collectionViews.append(viewOfPlatforms(vName: "Inclusice Learing", vImage: UIImage(named: "ic_inclusive-learning")))
        self.platformVC.reloadData()
        actionButton.display(inViewController: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
         self.platformVC.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        imgMoft.frame = CGRect(x: topVC.frame.width - 80, y: topVC.frame.height - 90, width: topVC.frame.height / 2 - 15 , height: topVC.frame.height / 2 - 15)
        imgLogo.frame = CGRect(x: topVC.frame.width / 9 - 12, y: topVC.frame.height / 2 - 55, width: topVC.frame.height , height: topVC.frame.height )
       // topVC.frame = CGRect(x: 0, y: 0, width: fulView.frame.width , height: fulView.frame.height)
    }
}

//MARK :- UICollectionView Extension for display
extension FrontScreenViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViews.count
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.row == 0)
        {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "TeleschoolViewController") as! TeleschoolViewController
        //VC.classID = classID[indexPath.row]
        self.present(VC, animated: true, completion: nil)
        }
        if(indexPath.row == 1)
        {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "RadioSchoolViewController") as! RadioSchoolViewController
            //VC.classID = classID[indexPath.row]
            self.present(VC, animated: true, completion: nil)
        }
        if(indexPath.row == 2)
        {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "DigitalPlatformViewController") as! DigitalPlatformViewController
            //VC.classID = classID[indexPath.row]
            self.present(VC, animated: true, completion: nil)
        }
        if(indexPath.row == 3)
        {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "AccleratedViewController") as! AccleratedViewController
            //VC.classID = classID[indexPath.row]
            self.present(VC, animated: true, completion: nil)
        }
        if(indexPath.row == 4)
        {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "InclusiveLearningViewController") as! InclusiveLearningViewController
            //VC.classID = classID[indexPath.row]
            self.present(VC, animated: true, completion: nil)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let taleemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? DashBoardCollectionViewCell{
            taleemCell.configure(with: collectionViews[indexPath.row])
            cell = taleemCell
            
          //  let view = UIView(frame: cell.bounds)
            // Set background color that you want
          //  view.backgroundColor = color.hexStringToUIColor(hex: (colorCV[indexPath.row]))
           // print("\(colorCV[indexPath.row])  \(view.backgroundColor)")
            taleemCell.mainVC.backgroundColor = color.hexStringToUIColor(hex: (colorCV[indexPath.row]))
            taleemCell.txtVC.backgroundColor = color.hexStringToUIColor(hex: (colorTxtCV[indexPath.row]))
         //   cell.backgroundView = view
        }
        return cell
    }
}

//MARK :- UIcollectionView Extension For FlowLayout
extension FrontScreenViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (platformVC.frame.width / 2) - 6
        return CGSize(width: itemSize, height: itemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
    }
}



