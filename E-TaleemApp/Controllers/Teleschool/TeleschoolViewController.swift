import UIKit
import Alamofire
import SwiftyJSON
import JJFloatingActionButton
import MaterialActivityIndicator
import SwiftyGif

class TeleschoolViewController: UIViewController {

    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var topVC: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var imgMoft: UIImageView!
    @IBOutlet weak var platFormVC: UICollectionView!
    
    var classData : [Classes] = []
    var m = ClassService()
    var colorArray : [String] =  []
    var classID : [Int] = []
    var imageUrlString : [String] = []
    var imageArray : [UIImage] = []
     let gif = try! UIImage(gifName: "Teleschool-text")
    let indicator = MaterialActivityIndicatorView()
    let color = UIColor()
   

    fileprivate let actionButton = JJFloatingActionButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        gifImage.setGifImage(gif, loopCount: 1)
         //gifImage.startAnimatingGif()
        //sleep(5)
     //   gifImage.stopAnimatingGif()
        
        setupActivityIndicatorView()
        self.topVC.layer.mask = function.shared.topViewRoundCorner(bounds: self.topVC.bounds)
        
        actionButton.display(inViewController: self)
        indicator.startAnimating()
        apiCall()
    }
    override func viewDidAppear(_ animated: Bool) {
        gifImage.setGifImage(gif, loopCount: 1)
    }
//    @IBAction func toggleAnimation(_ sender: AnyObject) {
//
//    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        btnBack.frame = CGRect(x: 12, y: topVC.frame.height / 2 + 5, width: topVC.frame.height / 6, height: topVC.frame.height / 6)
        imgMoft.frame = CGRect(x: topVC.frame.width - 80, y: topVC.frame.height - 90, width: topVC.frame.height / 2 - 15 , height: topVC.frame.height / 2 - 15)
        imgLogo.frame = CGRect(x: topVC.frame.width / 7 , y: topVC.frame.height / 2 - 55, width: topVC.frame.height , height: topVC.frame.height )
    }
    
    

    func apiCall()
    {
        
        classData = m.allc()
        
        for i in classData
        {
            self.colorArray.append(i.color)
            self.imageUrlString.append(i.icon)
            self.classID.append(i.id)
        }
        self.addImage()
        self.platFormVC.reloadData()
        self.indicator.stopAnimating()
//        Alamofire.request("http://etaleem.gov.pk/api/tele-school").responseJSON{
//            response in
//            if let responseStr = response.result.value {
//                let jsonResponse = JSON(responseStr)
//                let jsonAll = jsonResponse["data"]
//
//                let jsonClassesData = jsonAll["classes"]
//                for i in 0..<jsonClassesData.count
//                {
//                    self.colorArray.append(jsonClassesData[i]["color"].stringValue)
//                    self.imageUrlString.append(jsonClassesData[i]["icon"].stringValue)
//                    self.classID.append(jsonClassesData[i]["id"].int!)
//                }
//
//self.addImage()
//            }
//            self.platFormVC.reloadData()
//            self.indicator.stopAnimating()
//        }
        
    }
    func addImage()
    {
        for i in imageUrlString
        {
            let imageUrl:URL = URL(string: i)!
            let imageData = try? Data(contentsOf: imageUrl)
            let image = UIImage(data: imageData!)
            imageArray.append(image!)
        }
    }
    func setupActivityIndicatorView() {
        view.addSubview(indicator)
        setupActivityIndicatorViewConstraints()
    }
    
    func setupActivityIndicatorViewConstraints() {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
//        let VC = self.storyboard?.instantiateViewController(withIdentifier: "ClassesViewController") as! FrontScreenViewController
//        VC.classID = classID[indexPath.row]
//        self.dismiss(animated: true, completion: nil)
//        self.present(VC, animated: true, completion: nil)
    }
}
//MARK :- UICollectionView Extension for display
extension TeleschoolViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let teleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? TeleschoolCollectionViewCell{
            teleCell.imageView.image = imageArray[indexPath.row]
            cell = teleCell
            teleCell.MainVC.layer.borderColor = color.hexStringToUIColor(hex: colorArray[indexPath.row]).cgColor
            teleCell.lblName.textColor = color.hexStringToUIColor(hex: colorArray[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "ClassesViewController") as! ClassesViewController
        VC.classID = classID[indexPath.row] - 1
        self.present(VC, animated: true, completion: nil)
    }
    
}

//MARK :- UIcollectionView Extension For FlowLayout
extension TeleschoolViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (platFormVC.frame.width / 2) - 6
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
