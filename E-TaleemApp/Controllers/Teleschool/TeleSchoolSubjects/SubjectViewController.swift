//
//  SubjectViewController.swift
//  E-TaleemApp
//
//  Created by apple on 12/11/2021.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import WebKit
class SubjectViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var topVC: UIView!
    @IBOutlet weak var imgLogo: UILabel!
    @IBOutlet weak var imgMoft: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    
   // let webView = WKWebView()
    var sID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.addSubview(webView)
        self.topVC.layer.mask = function.shared.topViewRoundCorner(bounds: self.topVC.bounds)
        let baseURL = "https://etaleem.gov.pk/lectures?class_id=2&subject_id="
        let id = "\(sID)"
        print("id=\(id)  SID=\(sID)")
        let fullURl = baseURL + id
        guard let url = URL(string: fullURl) else{
            return
        }
        webView.load(URLRequest(url: url))
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        btnBack.frame = CGRect(x: 12, y: topVC.frame.height / 2 + 5, width: topVC.frame.height / 6, height: topVC.frame.height / 6)
        imgMoft.frame = CGRect(x: topVC.frame.width - 80, y: topVC.frame.height - 90, width: topVC.frame.height / 2 - 15 , height: topVC.frame.height / 2 - 15)
        imgLogo.frame = CGRect(x: topVC.frame.width / 7 , y: topVC.frame.height / 2 - 55, width: topVC.frame.height , height: topVC.frame.height )
       
    }
    
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
