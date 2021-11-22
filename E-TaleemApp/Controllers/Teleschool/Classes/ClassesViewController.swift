import UIKit
import Alamofire
import SwiftyJSON
class ClassesViewController: UIViewController {

    @IBOutlet weak var topVC: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgMoft: UIImageView!
    
    @IBOutlet weak var imgLogo: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    
    let color = UIColor()
    var colorArray : [String] =  []
    var imageUrlString : [String] = []
    var imageArray : [UIImage] = []
    var subjectName : [String] = []
    var sID : [Int] = []
    var classID = 0
    var baseUrl = "https://etaleem.gov.pk/api/class-subjects/"
    override func viewDidLoad() {
        super.viewDidLoad()
        imgLogo.text = "Class \(classID)"
        self.topVC.layer.mask = function.shared.topViewRoundCorner(bounds: self.topVC.bounds)
        baseUrl = ("\(baseUrl)\(classID)")
        //print("\(classID)  \(baseUrl)")
        apiCall()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        btnBack.frame = CGRect(x: 12, y: topVC.frame.height / 2 + 5, width: topVC.frame.height / 6, height: topVC.frame.height / 6)
        imgMoft.frame = CGRect(x: topVC.frame.width - 80, y: topVC.frame.height - 90, width: topVC.frame.height / 2 - 15 , height: topVC.frame.height / 2 - 15)
        imgLogo.frame = CGRect(x: topVC.frame.width / 7 , y: topVC.frame.height / 2 - 55, width: topVC.frame.height , height: topVC.frame.height )
    }
    
    func apiCall()
    {
        Alamofire.request(baseUrl).responseJSON{
            response in
            if let responseStr = response.result.value {
                let jsonResponse = JSON(responseStr)
                let jsonAll = jsonResponse["data"]
                
                let jsonClassesData = jsonAll["subjects"]
                print(jsonClassesData)
                for i in 0..<jsonClassesData.count
                {
                    self.colorArray.append(jsonClassesData[i]["color_code"].stringValue)
                    self.imageUrlString.append(jsonClassesData[i]["icon"].stringValue)
                    self.subjectName.append(jsonClassesData[i]["name"].stringValue)
                    self.sID.append(jsonClassesData[i]["id"].int!)
                    //self.classID.append(jsonClassesData[i]["id"].int!)
                }
                print("\(self.colorArray) \(self.imageUrlString)")
                self.addImage()
            }
            self.tableView.reloadData()
        }
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
    
    
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ClassesViewController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //print(view.frame.height / 3)
        print("height     ", tableView.frame.height / 4)
        return tableView.frame.width / 2
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ClassesTableViewCell
        cell.centerButton.backgroundColor = color.hexStringToUIColor(hex: colorArray[indexPath.row])
        if((indexPath.row + 1) % 2 == 0)
        {
            cell.imgView2.image = imageArray[indexPath.row]
            cell.lblText2.text = subjectName[indexPath.row]
            cell.View1.alpha = 0
        }
        else
        {
            cell.imgView1.image = imageArray[indexPath.row]
            cell.lblTxt1.text = subjectName[indexPath.row]
            cell.View2.alpha = 0
        }
        //if int
        //cell.price.text = "\(device.price!)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        tableView.deselectRow(at: indexPath, animated: true)
////        //startConversation
////        let targerUserData = results[indexPath.row]
////        dismiss(animated: true, completion: {[weak self] in
////            self?.completion?(targerUserData)
////        })
        tableView.deselectRow(at: indexPath, animated: true)
       // let Cell = tableView.cellForRow(at: indexPath)
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "SubjectViewController") as! SubjectViewController
        VC.sID = sID[indexPath.row]
        self.present(VC, animated: true, completion: nil)
    }
}
