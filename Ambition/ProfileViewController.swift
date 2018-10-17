//
//  ProfileViewController.swift
//  Ambition
//
//  Created by Fullname on 10/17/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    
    fileprivate let viewModel = ProfileViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView?.dataSource = viewModel
        
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableViewAutomaticDimension
        
        tableView?.register(AboutCell.nib, forCellReuseIdentifier: AboutCell.identifier)
        tableView?.register(NamePictureCell.nib, forCellReuseIdentifier: NamePictureCell.identifier)
        tableView?.register(FriendCell.nib, forCellReuseIdentifier: FriendCell.identifier)
        tableView?.register(AttributeCell.nib, forCellReuseIdentifier: AttributeCell.identifier)
        tableView?.register(EmailCell.nib, forCellReuseIdentifier: EmailCell.identifier)
    }

   

}
