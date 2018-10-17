//
//  LoginViewController.swift
//  Ambition
//
//  Created by Fullname on 10/16/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MRProgress
class LoginViewController: BaseViewController {
    


    let loginCell = "LoginTableViewCell"
    var arrRes = [[String:AnyObject]]()
    
    @IBOutlet weak var tbView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
      tbView.register(UINib(nibName: "LoginTableViewCell", bundle: nil), forCellReuseIdentifier: loginCell)
      tbView.delegate = self
      tbView.dataSource = self
        getData()
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    func getData(){
        
       showDialog()
   
        
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                self.dismissDialog()
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tbView.reloadData()
                }
            }
        }
        
    }
    
 



}


extension LoginViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return "Title \(section)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        switch section {
        case 0:
            return arrRes.count
        default:
            return arrRes.count
        }
        
      
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: loginCell) as! LoginTableViewCell
         var dict = arrRes[(indexPath as NSIndexPath).row]
        cell.tag = indexPath.row
        cell.lbName?.text = dict["name"] as? String
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    
    
    
}


