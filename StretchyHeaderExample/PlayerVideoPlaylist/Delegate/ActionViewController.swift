//
//  ActionViewController.swift
//  StretchyHeaderExample
//
//  Created by Emiliano Barbosa on 10/11/21.
//  Copyright © 2021 John Codeos. All rights reserved.
//

import UIKit

class ActionViewController: UIViewController {
    var actionView = ActionView()
    var actionController = ActionController()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        actionController.userId = "#robert"
        actionController.errorHandler = { (error) in
            
        }
        
        actionView.delegate = actionController
    }
}
