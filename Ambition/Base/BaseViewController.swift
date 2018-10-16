//
//  BaseViewController.swift
//  Ambition
//
//  Created by Fullname on 10/16/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit
import MRProgress
class BaseViewController: UIViewController {
    var overlay = MRProgressOverlayView()
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    func showDialog(){
        overlay = MRProgressOverlayView.showOverlayAdded(to: self.view, animated: false)
    }
    
    func dismissDialog(){
        overlay.dismiss(true)
    }


}
