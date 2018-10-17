//
//  FirstViewController.swift
//  Ambition
//
//  Created by Fullname on 10/17/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, MyProtocol  {
    
    

    func setResultOfBusinessLogic(valueSent: String) {
        self.valueSentFromSecondViewController = valueSent
    }
    

    
    // 1. Declare a new variable to hold data sent from SecondViewController
    var valueSentFromSecondViewController:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 2. Add viewWillAppear to display the value of the variable
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 3. Before displaying the value check if it contains data
        if let valueToDisplay = valueSentFromSecondViewController
        {
            print("Value from display = \(valueToDisplay)")
        }
    }
    
    
    //4. Implement MyProtocol's function to make FirstViewContoller conform to MyProtocol
    // MARK: MyProtocol functions
 

 

    @IBAction func goToSecondView(_ sender: Any) {
        
        let secondVc = SecondViewController()
        secondVc.delegate = self
        self.navigationController?.pushViewController(secondVc, animated: true)
        
    }
    
}
