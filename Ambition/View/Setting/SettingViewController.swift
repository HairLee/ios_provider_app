//
//  SettingViewController.swift
//  Ambition
//
//  Created by Fullname on 10/16/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    func pushToNextVC() {
        let newVC = LoginViewController()
        newVC.view.backgroundColor = UIColor.red
         self.tabBarController?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(newVC, animated:
            true)
    }
    
 

    @IBAction func btnAction(_ sender: Any) {
            pushToNextVC()
    }
}
