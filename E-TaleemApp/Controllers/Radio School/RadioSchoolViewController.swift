//
//  RadioSchoolViewController.swift
//  E-TaleemApp
//
//  Created by apple on 16/11/2021.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import WebKit

class RadioSchoolViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var topVC: UIView!
    @IBOutlet weak var imgMoft: UIImageView!
    @IBOutlet weak var imgLogo: UILabel!
    @IBOutlet weak var btnBacl: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // view.addSubview(webView)
        self.topVC.layer.mask = function.shared.topViewRoundCorner(bounds: self.topVC.bounds)
        let baseURL = "https://etaleem.gov.pk/radio-school"
        guard let url = URL(string: baseURL) else{
            return
        }
        webView.load(URLRequest(url: url))
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        btnBacl.frame = CGRect(x: 12, y: topVC.frame.height / 2 + 5, width: topVC.frame.height / 6, height: topVC.frame.height / 6)
        imgMoft.frame = CGRect(x: topVC.frame.width - 80, y: topVC.frame.height - 90, width: topVC.frame.height / 2 - 15 , height: topVC.frame.height / 2 - 15)
        imgLogo.frame = CGRect(x: topVC.frame.width / 7 , y: topVC.frame.height / 2 - 55, width: topVC.frame.height , height: topVC.frame.height )
    }
    
    @IBAction func backButton(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
